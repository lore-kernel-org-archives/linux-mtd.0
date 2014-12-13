Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzbVH-0000xN-7v
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 01:28:15 +0000
Received: by mail-ie0-f177.google.com with SMTP id rd18so7938972iec.22
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 17:27:54 -0800 (PST)
MIME-Version: 1.0
Sender: dehrenberg@google.com
In-Reply-To: <1417525136-25731-6-git-send-email-ezequiel.garcia@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-6-git-send-email-ezequiel.garcia@imgtec.com>
Date: Fri, 12 Dec 2014 17:27:53 -0800
Message-ID: <CAAK6Zt3DX0=cE0mvALRDhxDFqRzrDstSokzCTqEKmAT+qsm00A@mail.gmail.com>
Subject: Re: [PATCH 5/6] mtd: spi-nand: Add devicetree binding
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
> This commit adds the devicetree binding document that specifies the
> SPI NAND devices support.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

Reviewed-by: Dan Ehrenberg <dehrenberg@chromium.org>
