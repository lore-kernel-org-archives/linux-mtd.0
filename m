Subject: Re: [PATCH][MTD][NAND]Bad Block Management
From: David Woodhouse <dwmw2@infradead.org>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
In-Reply-To: <ac9c93b10808270359l18c89a84m6d14353e78ee60df@mail.gmail.com>
References: <1219830684.13957.25.camel@il93elnxlog2>
	<ac9c93b10808270359l18c89a84m6d14353e78ee60df@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 27 Aug 2008 17:31:06 +0100
Message-Id: <1219854666.7107.204.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Sheng-Zhe Zhao <a18689@motorola.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-08-27 at 12:59 +0200, Frans Meulenbroeks wrote:
> Wrt the device wise approach: I think I would prefer if I could say
> per partition if I wanted to use this (and thus have the mapping done
> per partition). That way filesystems that do their own bad block
> handling can do it the way they want to.Now it seems a little bit
> double work to have bad block handling in both the filesystem and in
> the mtd layer.

I don't believe it lives in the low-level MTD drivers. The _users_ (file
system code, translation layers, etc.) of devices should handle this as
they see fit (although we can provide _library_ code for them to use if
they want to). I don't think it lives in the NAND driver though.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
