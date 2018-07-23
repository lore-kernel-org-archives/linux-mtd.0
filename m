Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhXrk-0007e1-KU
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 10:14:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id a3-v6so122612wrt.2
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2018 03:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <1959109367.8330026.1532336539584.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1959109367.8330026.1532336539584.JavaMail.zimbra@raptorengineeringinc.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 23 Jul 2018 12:14:30 +0200
Message-ID: <CACna6ryaT7Q=FSH_UBs5p6H3VdkpeKH_AYbQ=_WPB7N3xqoaOg@mail.gmail.com>
Subject: Re: [PATCH] mtd/powernv_flash: Enable partition support
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-mtd@lists.infradead.org, Stewart Smith <stewart@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 23 Jul 2018 at 11:02, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> On certain systems, such as the Talos II, skiboot emits a partition
> table for the main PNOR MTD device in the generated device tree.
>
> Allow this partition table to be parsed and the partitions to be
> exposed via MTD device partition nodes.
>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

This already has been handled in the:
[PATCH] mtd: powernv_flash: set of_node in mtd's dev
https://patchwork.ozlabs.org/patch/943327/

I marked you as reporter, I Cc-ed you, Boris replied to it. I didn't
expect you to miss that change.
