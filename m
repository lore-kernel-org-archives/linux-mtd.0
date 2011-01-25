Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Phgp4-0007vX-Fc
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 11:12:31 +0000
Received: by fxm19 with SMTP id 19so5297148fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Jan 2011 03:12:29 -0800 (PST)
Subject: Re: UBI: corrupted PEB detection for Numonyx P30
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Holger Brunck <holger.brunck@keymile.com>
In-Reply-To: <4D3D7AB5.50401@keymile.com>
References: <4D3D7AB5.50401@keymile.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 25 Jan 2011 13:11:54 +0200
Message-ID: <1295953914.7118.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Walter, Axel" <Axel.Walter@keymile.com>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-01-24 at 14:12 +0100, Holger Brunck wrote:
>         err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
> -       if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR) {
> +       if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
> +           err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS) {
>                 struct ubi_ec_hdr ec_hdr;
> 
>                 err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
> -               if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR)
> +               if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
> +                   err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS) {
>                         /*
>                          * Both VID and EC headers are corrupted, so we can
>                          * safely erase this PEB and not afraid that it will be
> 
> Does anyone see a problem with this patch? If not I can post it as a git patch
> on the mailing list.

Hi, I agree with checking for UBI_IO_FF, but not for UBI_IO_FF_BITFLIPS,
because (a) NOR should not have them and (b) bit-flip means the the
header is correct, but there was a correctable bit-blip. But we want to
find the headers corrupted in this piece of code. 

I've prepared and pushed almost the same patch, made you the author:
http://git.infradead.org/ubi-2.6.git/commit/4782254b5f76c22726d270ea753816cefa088ae9

Please, take a look and check. If you do not like it, let me know or
just send the patch you like.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
