Received: from smtp.flash.net.br ([201.46.240.48] helo=smtp.gru.flash.tv.br)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LyocE-0005UH-Hn
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 14:49:04 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.gru.flash.tv.br (Postfix) with ESMTP id 00ACC1E6A5E
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Apr 2009 11:48:39 -0300 (BRT)
Received: from smtp.gru.flash.tv.br ([127.0.0.1])
	by localhost (smtp.gru.flash.tv.br [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qenAr7dnEGop for <linux-mtd@lists.infradead.org>;
	Tue, 28 Apr 2009 11:48:35 -0300 (BRT)
Received: from chagas.nectar.ath.cx (unknown [187.22.248.170])
	by smtp.gru.flash.tv.br (Postfix) with ESMTPA id 10B0D1E67BB
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Apr 2009 11:48:29 -0300 (BRT)
Date: Tue, 28 Apr 2009 11:48:14 -0300
From: =?utf-8?Q?Rog=C3=A9rio?= Brito <rbrito@ime.usp.br>
To: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: minimizing the configuration of
	linkstation_defconfig
Message-ID: <20090428144814.GA14926@ime.usp.br>
References: <20090424065816.GA15525@ime.usp.br>
	<Pine.LNX.4.64.0904242158210.8309@axis700.grange>
	<20090424223355.GB7858@ime.usp.br>
	<2CE2BC61-1C6B-4D01-870B-BC460730AD79@kernel.crashing.org>
	<20090428022711.GA30538@ime.usp.br>
	<F78629F9-59D2-4974-8461-06B7FAC2625D@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F78629F9-59D2-4974-8461-06B7FAC2625D@kernel.crashing.org>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 28 2009, Kumar Gala wrote:
> I'm pretty sure we need this for old initrd style ramdisks so I'd prefer 
> we leave it enabled.

Oh, for oldstyle it is needed. You're right. It is better to keep it in
the defconfig. Just drop the hunk from the patch that I sent you.

>> Thanks. The MTD & PHYMAP_COMPAT are the things that have been bugging
>> me and my main reason to keep with the bleeding edge kernels is to
>> get things whey they were (regarding mtd) as in kernel 2.6.28.
>>
>> As I have no experience with MTD devices, I would appreciate a
>> reference to their workings... All that I know is that all my
>> /dev/mtd* devices are gone if I boot a 2.6.29* kernel.
>>
>> Of course, I can do a git bisect process (since the MTD subsystem
>> doesn't work as it did in the past even if I enable PHYMAP_COMPAT and
>> put the same settings there, quite unfortunately).
>
> ok.. I killed my kurobox long ago so can't be much help here.

Oh... :-(

I will post the problems that I get with MTD on my kurobox so that
people from both the linux-mtd/linuxppc-dev lists can see what is
happening and suggest some fixes.


Thanks, Rogério Brito.

-- 
Rogério Brito : rbrito@{mackenzie,ime.usp}.br : GPG key 1024D/7C2CAEB8
http://www.ime.usp.br/~rbrito : http://meusite.mackenzie.com.br/rbrito
Projects: algorithms.berlios.de : lame.sf.net : vrms.alioth.debian.org
