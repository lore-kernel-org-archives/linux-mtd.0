Received: from mail-it1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi2oP-0006tY-Nq
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 19:49:51 +0000
Received: by mail-it1-x12b.google.com with SMTP id m62so4401806ith.5
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2019 11:49:49 -0800 (PST)
MIME-Version: 1.0
References: <CAMawHmDZj-Ht4PKtB72B8fPOSiPVefAwt=hkaiu8bhyOeUAG8A@mail.gmail.com>
In-Reply-To: <CAMawHmDZj-Ht4PKtB72B8fPOSiPVefAwt=hkaiu8bhyOeUAG8A@mail.gmail.com>
From: Zachary Graham <zack.graham@gmail.com>
Date: Fri, 11 Jan 2019 11:49:57 -0800
Message-ID: <CAMawHmC8xF6Pe+S-3UmJ-sGYE6pUvdLRGbnYiztjsOzYCnBQAg@mail.gmail.com>
Subject: Re: Bad block detection question
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 11, 2019 at 11:27 AM Zachary Graham <zack.graham@gmail.com> wrote:
>
> Hello,
>
> I'm working with a Linux system that, for the most part, uses
> UBI/UBIFS save for one small MTD that is used for boot-time
> information. I'm currently working on our tool to manipulate data on
> this disk and want to ensure it is robust to bad blocks.
Since I wasn't explicit about this, this is a NAND flash device.
