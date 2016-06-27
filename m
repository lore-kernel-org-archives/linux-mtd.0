Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHQcl-0002A4-IR
 for linux-mtd@lists.infradead.org; Mon, 27 Jun 2016 07:06:29 +0000
Subject: Re: [PATCH] ubi: Speedup ubi_io_read_vid_hdr()
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20160624093957.528c48dc@bbrezillon>
 <1466843991-3423-1-git-send-email-richard@nod.at>
 <20160627052239.GP20657@pengutronix.de>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <5770D057.4040306@nod.at>
Date: Mon, 27 Jun 2016 09:05:59 +0200
MIME-Version: 1.0
In-Reply-To: <20160627052239.GP20657@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.06.2016 um 07:22 schrieb Sascha Hauer:
> On Sat, Jun 25, 2016 at 10:39:51AM +0200, Richard Weinberger wrote:
>> Currently we read a whole (sub)page from flash when reading
>> the VID header.
>> Sascha reported that reading only UBI_VID_HDR_SIZE instead
>> gives him a decent speedup during a full scan.
>>
>> Since we have to obey shifted headers too we have to read
>> ubi->vid_hdr_shift + UBI_VID_HDR_SIZE bytes.
>> It is also important to set the buffer to 0xff bytes before
>> reading as in ubi_io_write_vid_hdr() the whole (sub)page
>> is written back to flash and we cannot risk leaking
>> kernel memory into the storage medium.
>>
>> Reported-by: Sascha Hauer <s.hauer@pengutronix.de>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>> Sascha,
>>
>> can you please this patch a try?
> 
> I already did, this was exactly my suggestion after you mentioned that
> my initial patch breaks when vid_hdr_shift is non zero.
> I tested it without the memset though.

Yeah, the memset() is not needed, I was wrong.
So we can take your version.

Thanks,
//richard
