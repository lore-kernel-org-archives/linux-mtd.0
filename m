Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeoWW-0005W9-Qt
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 14:26:17 +0000
Received: by lbbgg6 with SMTP id gg6so1348185lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2012 07:26:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
 <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
Date: Wed, 13 Jun 2012 17:26:11 +0300
Message-ID: <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
From: Ran Shalit <ranshalit@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> If I start several executable from ubifs in some start point, Is it
>> right to assume that all of them are running in RAM, and there is no
>> access to flash after this start point of execution ?
>
>
> As someone else mentioned on the mtd list, Linux is demand paged which means
> that the code is loaded into memory when needed. If there's a chunk of code
> (Linux uses a page size of 4 kbytes so that's the granularity of the paging)
> that is not used until after a while after the start of execution, it won't
> be loaded until it is actually run.
>
> I don't know if there's a way to force it all into memory when execution
> starts; there probably is.
>
In embedded system it is desired to execute only from RAM, therefore
it seems that ubifs is not best choice here.
It seems that in order to run completely from RAM I need to copy all
the files in ubifs potion to RAM and then execute the application in
RAM. Therefore it seems that best choice here would be to use both
root file system in RAM, and also mount ubifs file system in flash,
for easily flashing executables and other files. Is there a simpler
way that I miss here or any wrong assumptions I've made ?

Many Thanks, Ran
