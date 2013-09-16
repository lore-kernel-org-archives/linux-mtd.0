Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLhqJ-000326-Mh
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2013 23:04:32 +0000
Received: by mail-wi0-f176.google.com with SMTP id cb5so4146193wib.9
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 16:04:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376327699-7973-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376327699-7973-2-git-send-email-ezequiel.garcia@free-electrons.com>
Date: Mon, 16 Sep 2013 15:57:54 -0700
Message-ID: <CAOesGMjQz+yEUQYt1b_okRMPoNvUAj4zXBmJKCbmrekN5KziBQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] mtd: nand: pxa3xx: Remove unneeded ifdef
 CONFIG_OF
From: Olof Johansson <olof@lixom.net>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 10:14 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> There's no need to enclose this code within idef CONFIG_OF,
> because the OF framework provides no-op stubs if CONFIG_OF=n.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

I've applied this to arm-soc fixes (with Brian's signed-off inbetween,
since I picked it up from linux-next by cherry-pick). Based on other
discussions, David is MIA and this patch is needed to fix pxa3xx
builds.


-Olof
