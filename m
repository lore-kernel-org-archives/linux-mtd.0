Received: from mail.de.keymile.com ([195.8.104.1])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Phh7s-000857-10
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 11:31:56 +0000
Message-ID: <4D3EB4A7.1010202@keymile.com>
Date: Tue, 25 Jan 2011 12:31:51 +0100
From: Holger Brunck <holger.brunck@keymile.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: UBI: corrupted PEB detection for Numonyx P30
References: <4D3D7AB5.50401@keymile.com> <1295953914.7118.11.camel@localhost>
In-Reply-To: <1295953914.7118.11.camel@localhost>
Content-Type: text/plain;
	charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "Walter, Axel" <Axel.Walter@keymile.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2011-01-24 at 14:12 +0100, Holger Brunck wrote:
>>         err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
>> -       if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR) {
>> +       if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
>> +           err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS) {
>>                 struct ubi_ec_hdr ec_hdr;
>>
>>                 err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
>> -               if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR)
>> +               if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
>> +                   err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS) {
>>                         /*
>>                          * Both VID and EC headers are corrupted, so we can
>>                          * safely erase this PEB and not afraid that it will be
>>
>> Does anyone see a problem with this patch? If not I can post it as a git patch
>> on the mailing list.
> 
> Hi, I agree with checking for UBI_IO_FF, but not for UBI_IO_FF_BITFLIPS,
> because (a) NOR should not have them and (b) bit-flip means the the
> header is correct, but there was a correctable bit-blip. But we want to
> find the headers corrupted in this piece of code. 
> 

Ok.

> I've prepared and pushed almost the same patch, made you the author:
> http://git.infradead.org/ubi-2.6.git/commit/4782254b5f76c22726d270ea753816cefa088ae9
> 
> Please, take a look and check. If you do not like it, let me know or
> just send the patch you like.
> 

Yes this is ok for me.

Thanks.

Best regards
Holger Brunck
