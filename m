Received: from smtp-vbr3.xs4all.nl ([194.109.24.23])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbqKL-0002pw-7z
	for linux-mtd@lists.infradead.org; Fri, 14 Aug 2009 06:31:53 +0000
Message-ID: <4A8504D1.1050506@adesys.nl>
Date: Fri, 14 Aug 2009 08:31:45 +0200
From: Teun Grinwis <teun@adesys.nl>
MIME-Version: 1.0
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: flash section set to 0x0 on jffs2 filesystem
References: <4A83BD1F.6070806@adesys.nl> <4A83C4D5.8080704@aimvalley.nl>
In-Reply-To: <4A83C4D5.8080704@aimvalley.nl>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mtd List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Norbert,
Thanks for your tips.

Norbert van Bolhuis wrote:
> Hallo Teun,
>
> Is there no kernel/jffs2 error message or whatsoever ?
> I would expect a node CRC error (maybe if you unount and mount jffs2 
> fs again).
There are no errors with mounting.
>
> Use jffs2dump to check your jffs2 partition, it's available
What does jffs2dump do ? only dump data, or also check the jffs2 admin 
consistancy??
I have already uploaded my filesystem to Linux Host. jffs2dump has 
compile errors on my system
(missing uuid.h).
> in the mtd-utils git repository, see 
> git://git.infradead.org/mtd-utils.git
>
> It's difficult to "reconstruct" the original exec. file though from
> the jffs2dump info since jffs2 compresses data.
>
> Groetjes,
> Norbert.
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 

Groeten / With kind regards,

Teun Grinwis
