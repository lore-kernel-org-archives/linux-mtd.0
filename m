Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RV61o-0001hm-PR
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 18:34:10 +0000
Received: by wwf25 with SMTP id 25so1621046wwf.18
 for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2011 10:34:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322490040-27161-1-git-send-email-j.weitzel@phytec.de>
References: <1322490040-27161-1-git-send-email-j.weitzel@phytec.de>
Date: Mon, 28 Nov 2011 10:34:06 -0800
Message-ID: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
Subject: Re: [RFC] mtd/nand: modify NAND_CHIPOPTIONS_MSK
From: Brian Norris <computersforpeace@gmail.com>
To: Jan Weitzel <j.weitzel@phytec.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 28, 2011 at 6:20 AM, Jan Weitzel <j.weitzel@phytec.de> wrote:
> Trying to set NAND_NO_SUBPAGE_WRITE from platform fail, because
> nand_flash_detect_onfi options from struct nand_flash_dev overwrite the flag.
>
> Removing NAND_NO_SUBPAGE_WRITE from NAND_CHIPOPTIONS_MSK fix this,
> but setting it via struct nand_flash_dev table is not longer supported.

Is it necessary to change the mask? I'm not real familiar with this
particular option, but can't you set your flags after the initial
identification stage? For instance, something like this:

nand_scan_ident(mtd, ...);
chip->options |= NAND_NO_SUBPAGE_WRITE;
nand_scan_tail(mtd);

Brian
