Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgJOp-0008HO-SY
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 19:13:20 +0000
Received: by mail-qc0-f177.google.com with SMTP id b10so3148417qcw.36
 for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2013 11:12:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1384283245-9419-4-git-send-email-geert@linux-m68k.org>
References: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
 <1384283245-9419-4-git-send-email-geert@linux-m68k.org>
Date: Tue, 12 Nov 2013 11:12:57 -0800
Message-ID: <CAOesGMiPJU9sRWptxqC_GsvBX0jdsbhfGpvG0OKpL98Q1o1YfQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] mtd: pasemi_nand.c: Remove superfluous name cast
From: Olof Johansson <olof@lixom.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 11:07 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> device_driver.name is "const char *"
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: linux-mtd@lists.infradead.org

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
