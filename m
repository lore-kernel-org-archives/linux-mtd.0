Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFHa4-00069A-VV
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 17:17:34 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l18MFA9F002141
	for <linux-mtd@lists.infradead.org>; Thu, 8 Feb 2007 17:15:10 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l18MFA1q229020
	for <linux-mtd@lists.infradead.org>; Thu, 8 Feb 2007 17:15:10 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l18MFAjK025462
	for <linux-mtd@lists.infradead.org>; Thu, 8 Feb 2007 17:15:10 -0500
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Artem Bityutskiy <dedekind@infradead.org>
In-Reply-To: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 08 Feb 2007 16:16:02 -0600
Message-Id: <1170972968.4884.140.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTDML <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-02-08 at 22:02 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Subject: [PATCH] UBI: introduce sequential counter
>  
> This patch introduces the global sequence counter - a 64-bit number
> which is increased every time a LEB is mapped to a PEB. When a VID header
> is written, the current global sequence counter value is saved there and
> the counter is increased. So it each VID header contains unique sequence
> number and for any 2 PBS we can say which one is newer. The counter
> is 64-bit and we assume it never overflows.

Do image creation tools now how to understand how to increment the
counter for each block in a binary image that would be flashed onto the
card raw?  Or do you leave the counter in all the VID headers as 0 for
such images?
 
> Now, when the sequence counter is here, we do not need the 'leb_ver' field
> any longer but it was preserved for compatibility - so new UBI binaries
> understand old UBI versions and old UBI binaries understands new UBI images.
> But eventually we can remove the 'leb_ver' altogether.

If a new kernel is run with an older UBI image, will it automatically
start using the field and increment the counter values?  (If yes, that
makes my first question go away I think.)

> Essentially, 'leb_ver' is the same as 'sqnum' but 'leb_ver' it is per-LEB.
> The following are advantages and motivation for 'sqnum':
>  
> 1. it is not necessary to keep leb_ver field for in _each_ EBA table entry;
> 2. id does not overflow, so we do not have to do different perversions to
>    make sure we handle this properly
> 3. in the wear-leveling code we can distinguish between LEBs which were
>    written to long time ago and recently. Indeed, if the sequential number

No you can't.  You cannot determine time and rate from a simple counter
number.  All you can determine is that LEB N is older than LEB M.  It
could be older by 40 seconds, or older by 5 years.

>    is close to the current one, it was written recently. This provides us
>    an opportunity to distinguish between LEBs with static data vs. LEBs
>    with not really static data (e.g., we have just recently taken a LEB
>    with low erase counter and wrote data there). This is useful for WL.

Yes, this might help wear-leveling.  But if the data is used, I would
recommend being very conservative about using the counter value to
distinguish between "static" and "non-static" data.

> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
>  include/mtd/ubi-header.h |   71 ++++++++++++++++++++++++++++++++-------------
>  1 files changed, 50 insertions(+), 21 deletions(-)
>  
> Index: ubi-2.6.git/include/mtd/ubi-header.h
> ===================================================================
> --- ubi-2.6.git.orig/include/mtd/ubi-header.h
> +++ ubi-2.6.git/include/mtd/ubi-header.h
> @@ -166,34 +166,61 @@ struct ubi_Ev_hdr {
>   * %UBI_COMPAT_IGNORE, %UBI_COMPAT_PRESERVE, or %UBI_COMPAT_REJECT)
>   * @vol_id: ID of this volume
>   * @lnum: logical eraseblock number
> - * @leb_ver: eraseblock copy number

Please don't remove this until the member is actually removed.

>   * @data_size: how many bytes of data this eraseblock contains
>   * @used_ebs: total number of used logical eraseblocks in this volume
>   * @data_pad: how many bytes at the end of this eraseblock are not used
>   * @data_crc: CRC checksum of the data stored in this eraseblock
>   * @padding1: reserved for future, zeroes
> + * @sqnum: sequence number
> + * @padding2: reserved for future, zeroes
>   * @hdr_crc: volume identifier header CRC checksum
>   *
> - * The @leb_ver and the @copy_flag fields are used to distinguish between older
> - * and newer copies of the logical eraseblock, as well as to guarantee
> - * robustness against unclean reboots. As UBI erases logical eraseblocks
> - * asynchronously, in background, it has to distinguish between older and newer
> - * copies of logical eraseblocks. This is done using the @version field. On the
> - * other hand, when UBI moves data of an eraseblock, its version is also
> - * increased and the @copy_flag is set to 1. Additionally, when moving data of
> - * eraseblocks, UBI calculates data CRC and stores it in the @data_crc field,
> - * even for dynamic volumes.
> - *
> - * Thus, if there are 2 physical eraseblocks belonging to the logical
> - * eraseblock (same volume ID and logical eraseblock number), UBI uses the
> - * following algorithm to pick one of them. It first picks the one with larger
> - * version (say, A). If @copy_flag is not set, then A is picked. If @copy_flag
> - * is set, UBI checks the CRC of data of this physical eraseblock (@data_crc).
> - * This is needed to ensure that the copying was finished. If the CRC is all
> - * right, A is picked. If not, the older physical eraseblock is picked.
> - *
> - * Note, the @leb_ver field may overflow. Thus, if you have 2 versions X and Y,
> - * then X > Y if abs(X-Y) < 0x7FFFFFFF, otherwise X < Y.
> + * The @sqnum is the value of the global sequence counter at the time when this
> + * VID header was created. The global sequence counter only grows and is
> + * incremented each time UBI writes a new VID header to the flash, i.e. when it
> + * maps a logical eraseblock to a new physical eraseblock. The global sequence
> + * counter is an unsigned 64-bit integer and we assume it never overflows. The
> + * @sqnum (sequence number) is used to distinguish between older and newer
> + * versions of logical eraseblocks.
> + *
> + * There are 2 situations when there may be more then one physical eraseblock
> + * corresponding to the same logical eraseblock, i.e., having the same @vol_id
> + * and @lnum values in the volume identifier header. Suppose we have a logical
> + * eraseblock L and it is mapped to the physical eraseblock P.
> + *
> + * 1. Because UBI may erase physical eraseblocks asynchronously, the following
> + * situation may take place: L is asynchronously erased, P is scheduled for
> + * erasure, L is written to, so mapped to another physical eraseblock P1, so P1
> + * is written to, then an unclean reboot happens. Result - there are 2 physical
> + * eraseblocks P and P1. But P1 has greater sequence number, so UBI pick P1.

"... so UBI picks P1"

> + *
> + * 2. From time to time UBI moves the the contents of logical eraseblocks to
> + * other physical eraseblocks for wear-leveling reasons. If, for example, UBI
> + * moves the contents of L from P to P1, and an unclean reboot happens before P
> + * is physically erased, there are two physical eraseblocks P and P1
> + * corresponding to L and UBI has to select one of them. The @ts field says
> + * which PEB is the original (obviously P will have lower @ts) and the copy.

What is @ts?

> + * But it is not enough to select the physical eraseblock with the higher
> + * version, because the unclean reboot could have happen in the middle of the
> + * copying process, so the data in P is corrupted. It is also not enough to
> + * just select the physical eraseblock with lower version, because the data
> + * there may be old (consider a case if more data was added to P1 after the
> + * copying). Moreover, the unclean reboot may happen when the erasure of P was
> + * just started, so it may result in unstable P, which is "mostly" OK, but
> + * still has unstable data or is corrupted.
> + *
> + * UBI uses the @copy_flag field to indicate that this physical eraseblock is a
> + * copy of some other physical eraseblock. UBI also calculates data CRC when
> + * the data is moved and stores it at the @data_crc field of the copy (P1). So
> + * when there is a need to pick one physical eraseblock of two (P or P1), the
> + * @copy_flag of the newer one (P1) is examined. If it is cleared, the situation
> + * is simple and just the newer one is picked. If it is set, the data CRC of
> + * the copy (P1) is examined. If the CRC checksum is correct, this physical
> + * eraseblock is selected (P1). Otherwise the older one (P) is selected.
> + *
> + * Note, there is an obsolete @leb_ver field which was used instead of @ts in

Again with @ts... I think you mean @seqnum?

> + * the past. But it is not used anymore and we keep it in order to be able to
> + * deal with old UBI images. It will be removed at some point.
>   *
>   * There are 2 sorts of volumes in UBI: user volumes and internal volumes.
>   * Internal volumes are not seen from outside and are used for various internal
> @@ -244,12 +271,14 @@ struct ubi_vid_hdr {
>  	uint8_t compat;
>  	ubi32_t vol_id;
>  	ubi32_t lnum;
> -	ubi32_t leb_ver;
> +	ubi32_t leb_ver; /* obsolete, to be removed */
>  	ubi32_t data_size;
>  	ubi32_t used_ebs;
>  	ubi32_t data_pad;
>  	ubi32_t data_crc;
> -	uint8_t padding1[24];
> +	uint8_t padding1[4];
> +	ubi64_t sqnum;
> +	uint8_t padding2[12];

Can't you add the field at the bottom before hdr_crc so you don't have
split padding like that?

josh
