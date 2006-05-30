From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060530152406.GA15284@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 May 2006 16:40:20 +0100
Message-Id: <1149003621.2885.185.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-30 at 17:24 +0200, Jörn Engel wrote:
> Apart from the text substitution, the STMicro ECC-NOR and Intel Sibley
> flashes need special treatment.  This patch introduces a special
> kernel-only flag for them that jffs2 uses to call special code.  It
> should be noted that special code for these devices should not be
> used.  But until jffs2 is clean in that respect, the flag serves as a
> reminder that a cleanup is still required at some point.

Explain. Why shouldn't the existing code be used? What should we do
instead?

∃ only a certain number of combinations of features in _real_ hardware
-- fairly much covered by 'ROM, RAM, NOR, NAND and Sibley/ECC-NOR'.
Enumerating those, and coping specifically with those, makes as much
sense as handling arbitrary combinations of feature flags.

-- 
dwmw2
