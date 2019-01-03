Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf9pk-000435-7R
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2019 20:43:17 +0000
From: Richard Weinberger <richard@nod.at>
To: Kenneth Johansson <ken@kenjo.org>, bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: rawnand: nandsim: Add support to disable subpage
 writes.
Date: Thu, 03 Jan 2019 21:43:13 +0100
Message-ID: <6672633.KqxhzBgVKO@blindfold>
In-Reply-To: <10756fcb-b284-5465-ed5c-8251cb00d9c2@kenjo.org>
References: <20181222124008.28046-1-ken@kenjo.org>
 <10756fcb-b284-5465-ed5c-8251cb00d9c2@kenjo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kenneth,

Am Samstag, 22. Dezember 2018, 13:53:39 CET schrieb Kenneth Johansson:
> So there was a comment from Richard on the original patch that got 
> mangled so it did not even have a subject line.
> 
> The original intent for this patch was to make it possible to setup the 
> simulator with the same parameters as some real hardware.
> That is the command "mtdinfo /dev/mtdX" would show the same on the 
> simulator as the real hardware.

Just to make sure: nandsim simulates a given NAND chip but the simulated
NAND flash controller will always be different.
Think of ECC layout.

In this case it may be good enough to fool your userspace, but don't
count on it.
 
> It's true that you could change the vid offset with ubiattach but that 
> require you know that the LEB missmatch error you get is fixed by a 
> different vid offset and you need to understand what that value should be.
> This way you only need to match the basic mtd parameters and the rest 
> will just work automatically.

I agree that adding a parameter to nandsim to control subpage behavior
is nice.
But please keep in mind that nandsim will never perfectly match your hardware.

Boris, unless you have objections I'm fine to control NAND_NO_SUBPAGE_WRITE
in nandsim using a module parameter.

Thanks,
//richard
