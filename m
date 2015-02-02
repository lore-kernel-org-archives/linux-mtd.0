Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIMop-00015c-G0
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 19:38:07 +0000
Message-ID: <54CFD1FB.5030208@nod.at>
Date: Mon, 02 Feb 2015 20:37:31 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: Expose partition offset to the drivers
References: <1422894152-29362-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAFLxGvzdAFUFU2=ySRMdtAk=7hKvuHixrvPX0X+T533VPu=4dg@mail.gmail.com>
 <CAPybu_3D1cG3YpB8Y6h+UX2V7NN5Z9+BmDABt4J=6++KS=E8PQ@mail.gmail.com>
In-Reply-To: <CAPybu_3D1cG3YpB8Y6h+UX2V7NN5Z9+BmDABt4J=6++KS=E8PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

Hi!

Am 02.02.2015 um 20:33 schrieb Ricardo Ribalda Delgado:
> Hello
> 
> On Mon, Feb 2, 2015 at 8:17 PM, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
>> On Mon, Feb 2, 2015 at 5:22 PM, Ricardo Ribalda Delgado
>>
>> Can you please also send a patch which shows the usage of this new function
>> by a driver?
> 
> It is currently out of tree, but here you can see the relevant code:
> 
> mtd_offset=mtd_get_device_offset(mtd);
> put_mtd_device(mtd);
> if (do_jmp){
>     ret=qt5023_hwicap_reset(head,mtd_offset);
>     if (ret){
>         dev_err(&head->pci_dev->dev,"error: Failed to jump to new bitfile\n");
>         vfree(buffer);
>         release_firmware(firmware);
>         return -EIO;
>     }
>     qt5023_spi_restart(head);
> }

Hmm, will we ever need the new function for in-tree drivers?
In general we add new functions only if they have an in-tree user
for it.

Thanks,
//richard
