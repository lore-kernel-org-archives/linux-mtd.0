Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzauK-0005lV-23
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 00:50:04 +0000
Received: by mail-ig0-f177.google.com with SMTP id z20so2417307igj.16
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 16:49:42 -0800 (PST)
MIME-Version: 1.0
Sender: dehrenberg@google.com
In-Reply-To: <1417525136-25731-3-git-send-email-ezequiel.garcia@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-3-git-send-email-ezequiel.garcia@imgtec.com>
Date: Fri, 12 Dec 2014 16:49:41 -0800
Message-ID: <CAAK6Zt1ncdnibAYu25vOLF1uqycD+kgwXMtK8f0BOSCfoQvXWA@mail.gmail.com>
Subject: Re: [PATCH 2/6] mtd: nand: Add JEDEC manufacturer ID for Gigadevice
From: Daniel Ehrenberg <dehrenberg@chromium.org>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Cc: bpqw@micron.com, Ionela Voinescu <ionela.voinescu@imgtec.com>,
 frankliu@micron.com, Andrew Bresticker <abrestic@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 arnaud.mouiche@invoxia.com, Brian Norris <computersforpeace@gmail.com>,
 James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 2, 2014 at 4:58 AM, Ezequiel Garcia
<ezequiel.garcia@imgtec.com> wrote:
> This commit adds Gigadevice to the list of manufacturer ID and name strings.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

Reviewed-by: Dan Ehrenberg <dehrenberg@chromium.org>
