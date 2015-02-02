Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIMlD-0005xJ-HF
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 19:34:16 +0000
Received: by mail-la0-f43.google.com with SMTP id q1so44473118lam.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 11:33:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzdAFUFU2=ySRMdtAk=7hKvuHixrvPX0X+T533VPu=4dg@mail.gmail.com>
References: <1422894152-29362-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAFLxGvzdAFUFU2=ySRMdtAk=7hKvuHixrvPX0X+T533VPu=4dg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 2 Feb 2015 20:33:32 +0100
Message-ID: <CAPybu_3D1cG3YpB8Y6h+UX2V7NN5Z9+BmDABt4J=6++KS=E8PQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Expose partition offset to the drivers
To: Richard Weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

On Mon, Feb 2, 2015 at 8:17 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Mon, Feb 2, 2015 at 5:22 PM, Ricardo Ribalda Delgado
>
> Can you please also send a patch which shows the usage of this new function
> by a driver?

It is currently out of tree, but here you can see the relevant code:

mtd_offset=mtd_get_device_offset(mtd);
put_mtd_device(mtd);
if (do_jmp){
    ret=qt5023_hwicap_reset(head,mtd_offset);
    if (ret){
        dev_err(&head->pci_dev->dev,"error: Failed to jump to new bitfile\n");
        vfree(buffer);
        release_firmware(firmware);
        return -EIO;
    }
    qt5023_spi_restart(head);
}

Thanks

-- 
Ricardo Ribalda
