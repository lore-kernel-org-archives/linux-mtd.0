Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mDcU-0007hw-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2002 14:21:26 +0100
Date: Tue, 3 Sep 2002 15:26:50 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] added cfi_cmdset_0020.c
Message-ID: <20020903132650.GD18497@wohnheim.fh-wedel.de>
References: <20020903104437.GA15756@wohnheim.fh-wedel.de> <16859.1031056489@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16859.1031056489@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 3 September 2002 13:34:49 +0100, David Woodhouse wrote:
> joern@wohnheim.fh-wedel.de said:
> >  This adds cfi_cmdset_0020.c and hooks it into most places. No help
> > text yet, but that isn't covered by the cvs anyway.
> 
> patches/Config.help

Ok.

> Do we really need a completely separate copy, or could we get away with
> making the existing cfi_cmdset_0001 code handle this too? Or have we had
> this conversation already and I'm just having a bad week?

My guess is that this could be done, but it is less than
straightforward and would take more time than I have. Until you find a
person for that task, you should include it, as I already have two
independent users for this.

Jörn

-- 
If System.PrivateProfileString("",
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <>
"" Then  CommandBars("Macro").Controls("Security...").Enabled = False
-- from the Melissa-source
