Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GnHrp-0006JJ-1z
	for linux-mtd@lists.infradead.org; Thu, 23 Nov 2006 11:56:13 -0500
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1GnHrj-0001q6-Ot
	for linux-mtd@lists.infradead.org; Thu, 23 Nov 2006 17:55:59 +0100
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.1.11.41) with SMTP id
	M2006112317555909264
	for <linux-mtd@lists.infradead.org>; Thu, 23 Nov 2006 17:55:59 +0100
Received: from mail.inf.u-szeged.hu ([160.114.37.227])
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1GnHrj-0001r6-DD
	for linux-mtd@lists.infradead.org; Thu, 23 Nov 2006 17:55:59 +0100
Received: from [160.114.37.115] (osl01.inf.u-szeged.hu [160.114.37.115])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id 29C466480D1
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Nov 2006 17:55:59 +0100 (CET)
Message-ID: <4565D264.4060403@inf.u-szeged.hu>
Date: Thu, 23 Nov 2006 17:55:00 +0100
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Problems with sumtool with linux-mtd 1.0
References: <4565C738.30800@gfplab.com>
In-Reply-To: <4565C738.30800@gfplab.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Paolo!

I think there is no problem with sumtool.

If you run sumtool with --pad parameter then it pads the OUTPUT file with
0xFF to the end of the last used eraseblock.

If you have empty eraseblocks at the end of your INPUT image then the 
sumtool
skips those.

Zoltan

Paolo Scaffardi wrote:
> Hi there!
> I'm developing for a arm cirrus ep9302-based board target. The build
> system was based on an older mtd version. I upgraded to version 1.0.
> Now, it seems i have a problem using sumtool (that was never used before
> by build system after creating jffs2).
>
> I correctly made my jffs2 filesystem for my on-board flash (intel, NOR
> type, 128Kb x 128 blocks) with this cmd:
>
> mkfs.jffs2 --pad=$((8*1024*1024)) --eraseblock=$((128*1024)) -d
> /opt/mydir -o image.jffs2
>
> Then i called sumtool with:
>
> sumtool --pad --eraseblock=$((128*1024)) --input=image.jffs2
> --output=image2.jffs2
>
> The problem is that the second images was really smaller than the first
> one (384Kb).
>
> Why that?
> Sumtool dont give me any error!
>
> Bye,
> Paolo Scaffardi
> GFP Lab s.r.l.
> http://www.gfplab.com
> fax 178 2258454
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>   
