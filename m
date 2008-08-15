Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
From: David Woodhouse <dwmw2@infradead.org>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
In-Reply-To: <ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218472202.2977.12.camel@pmac.infradead.org>
	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>
	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
	<48A48330.70105@boundarydevices.com>
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 15 Aug 2008 09:46:37 +0100
Message-Id: <1218789997.3184.64.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Troy Kisky <troy.kisky@boundarydevices.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frans, thank you very much for your work. One question -- has this been
tested on 64-bit machines?

The patch still doesn't apply, unfortunately -- something seems to be
mangling it. In general, it's a good idea to send patches to yourself in
email first, then save them off from your own INBOX and try to apply
them to a clean kernel tree.

Please could you let me have a copy as an attachment, or just a straight
copy of both files? 

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
