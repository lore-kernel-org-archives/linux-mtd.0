Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xzafx-0000RI-0V
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 00:35:15 +0000
Received: by mail-ie0-f170.google.com with SMTP id rd18so7908755iec.29
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 16:34:50 -0800 (PST)
MIME-Version: 1.0
Sender: dehrenberg@google.com
In-Reply-To: <1417525136-25731-4-git-send-email-ezequiel.garcia@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-4-git-send-email-ezequiel.garcia@imgtec.com>
Date: Fri, 12 Dec 2014 16:34:43 -0800
Message-ID: <CAAK6Zt32o+A2Jz2gtN3hKAjR2Zu11SbZ_6iCbtdmjxVPAs1E7A@mail.gmail.com>
Subject: Re: [PATCH 3/6] mtd: nand: Allow to set a per-device ECC layout
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
> Until now, the ECC was handled either by Linux (i.e. software ECC) or by the
> NAND controller (i.e. hardware ECC). In each of these, the ECC layout is
> defined by the controller of the NAND device, not by the NAND device itself.
>
> However, devices with on-die ECC support have their own ECC layout so we need
> a way to specify a per-device ECC layout.
>
> This commit adds a new field to the nand_flash_dev structure, to allow devices
> to specify its own ECC layout.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

Reviewed-by: Dan Ehrenberg <dehrenberg@chromium.org>
