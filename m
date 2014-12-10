Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XyhG8-0003Vm-Bo
 for linux-mtd@lists.infradead.org; Wed, 10 Dec 2014 13:24:53 +0000
Message-ID: <5488498B.4030902@nod.at>
Date: Wed, 10 Dec 2014 14:24:27 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Yan Kong <ykong@sierrawireless.com>
Subject: Re: UBI errors when "ls -l"
References: <loom.20141210T102753-582@post.gmane.org>
 <CAFLxGvwqdi6T9zg_QH5Uw3D7R0dUPbX0G-7wDX6p47RBWoSdFw@mail.gmail.com>
 <740E8392C144C64FA5300E5E696A179BB97FEBB16F@carmd-exchmb01.sierrawireless.local>
In-Reply-To: <740E8392C144C64FA5300E5E696A179BB97FEBB16F@carmd-exchmb01.sierrawireless.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.12.2014 um 14:10 schrieb Yan Kong:
> Hi, Richard,
> 
> Your question,
> Is this a vanilla kernel or does it carry tons of vendor patches?
> --- I use the Kernel based on Yocto 1.6, but includes lots Qualcomm patches.
> 
>> ubiattach /dev/ubi_ctrl -m 3 -O 4096
> 
> Why do you need -O?
> --- I also tried without -O. But the result is the same.
> 
> Please use ubi tools to flash the image.
> (dd should work, but just in case...)
> --- I ever tried " ubiformat /dev/mtd7 -f ubi.img -s 4096", the same error :(.
> 
> What is line 213 in your drivers/mts/ubi/io.c?
> --- I marked line 213 as follow, thank you.
> 
> int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
> 		int len)
> {
> 	int err, retries = 0;
> 	size_t read;
> 	loff_t addr;
> 
> 	dbg_io("read %d bytes from PEB %d:%d", len, pnum, offset);
> 
> 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
> 	ubi_assert(offset >= 0 && offset + len <= ubi->peb_size);
> 	ubi_assert(len > 0);
> 
> 	err = paranoid_check_not_bad(ubi, pnum);
> 	if (err)
> 		return err;
> 
> 	/*
> 	 * Deliberately corrupt the buffer to improve robustness. Indeed, if we
> 	 * do not do this, the following may happen:
> 	 * 1. The buffer contains data from previous operation, e.g., read from
> 	 *    another PEB previously. The data looks like expected, e.g., if we
> 	 *    just do not read anything and return - the caller would not
> 	 *    notice this. E.g., if we are reading a VID header, the buffer may
> 	 *    contain a valid VID header from another PEB.
> 	 * 2. The driver is buggy and returns us success or -EBADMSG or
> 	 *    -EUCLEAN, but it does not actually put any data to the buffer.
> 	 *
> 	 * This may confuse UBI or upper layers - they may think the buffer
> 	 * contains valid data while in fact it is just old data. This is
> 	 * especially possible because UBI (and UBIFS) relies on CRC, and
> 	 * treats data as correct even in case of ECC errors if the CRC is
> 	 * correct.
> 	 *
> 	 * Try to prevent this situation by changing the first byte of the
> 	 * buffer.
> 	 */
> 	*((uint8_t *)buf) ^= 0xFF;
> 
> 	addr = (loff_t)pnum * ubi->peb_size + offset;
> retry:
> 	err = mtd_read(ubi->mtd, addr, len, &read, buf);
> 	if (err) {
> 		const char *errstr = mtd_is_eccerr(err) ? " (ECC error)" : "";
> 
> 		if (mtd_is_bitflip(err)) {
> 			/*
> 			 * -EUCLEAN is reported if there was a bit-flip which
> 			 * was corrected, so this is harmless.
> 			 *
> 			 * We do not report about it here unless debugging is
> 			 * enabled. A corresponding message will be printed
> 			 * later, when it is has been scrubbed.
> 			 */
> 			dbg_msg("fixable bit-flip detected at PEB %d", pnum);
> 			ubi_assert(len == read);
> 			return UBI_IO_BITFLIPS;
> 		}
> 
> 		if (retries++ < UBI_IO_RETRIES) {
> 			dbg_io("error %d%s while reading %d bytes from PEB "
> 			       "%d:%d, read only %zd bytes, retry",
> 			       err, errstr, len, pnum, offset, read);
> 			yield();
> 			goto retry;
> 		}
> 
> 		ubi_err("error %d%s while reading %d bytes from PEB %d:%d, "
> 			"read %zd bytes", err, errstr, len, pnum, offset, read);
> 		ubi_dbg_dump_stack();
> 
> 		/*
> 		 * The driver should never return -EBADMSG if it failed to read
> 		 * all the requested data. But some buggy drivers might do
> 		 * this, so we change it to -EIO.
> 		 */
> 		if (read != len && mtd_is_eccerr(err)) {
> 			ubi_assert(0);
> 			err = -EIO;
> 		}
> 	} else {
> 		ubi_assert(len == read);      <--------------------------------- line 213

Looks much like a broken MTD driver.
mtd_read() returned less than requested bytes.
Please make sure that both UBI and MTD tests pass.

Thanks,
//richard
