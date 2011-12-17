Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbvnz-0007A4-0f
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 15:04:08 +0000
Received: by eekc13 with SMTP id c13so2928551eek.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 07:04:05 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: [PATCH] libmtd: allow write operations when MEMWRITE is not
 supported
References: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
 <1323725206.2297.24.camel@koala>
 <CAN8TOE9-4j0pC5Vocu4v9toczvKAyKnRtZ6AE3fjt7Fk8PaZ=g@mail.gmail.com>
 <1324133082.4240.29.camel@sauron.fi.intel.com>
Date: Sat, 17 Dec 2011 16:03:59 +0100
In-Reply-To: <1324133082.4240.29.camel@sauron.fi.intel.com> (Artem
 Bityutskiy's message of "Sat, 17 Dec 2011 16:44:42 +0200")
Message-ID: <8762hf44v4.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

Hi,

 >> > I guess this require an urgent mtd-utils release.

 Artem> OK, I've cut mtd-utils-1.4.9 bug-fix release, this time with my
 Artem> new script, so I hope nothing is forgotten.

 Artem> Peter, please, update - this release fixes a bad bug which breaks NOR
 Artem> erase operation in not-yet-released 3.2 kernel.

Thanks for the heads up, I was just about to rebase a NOR-using platform
to 3.2.

Updated buildroot. It builds fine here, so it seems like the script is
working.

-- 
Bye, Peter Korsgaard
