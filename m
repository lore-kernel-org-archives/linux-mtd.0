Received: from mail-yk0-x229.google.com ([2607:f8b0:4002:c07::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR42t-0006iH-C8
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 18:19:56 +0000
Received: by mail-yk0-f169.google.com with SMTP id 142so7168501ykq.0
 for <linux-mtd@lists.infradead.org>; Fri, 21 Mar 2014 11:19:34 -0700 (PDT)
MIME-Version: 1.0
Sender: dmosberger@gmail.com
In-Reply-To: <CACwUX0PQP21PuSbQn6AvisaZuug9=JTwM3QoG5mXy54r6-tXCg@mail.gmail.com>
References: <CALnQHM3PJCzB86S65TmKE14_HY7DxwVgtXAOcphrGcCJ4t24GQ@mail.gmail.com>
 <20140321180547.GA11793@arch.cereza>
 <CACwUX0PQP21PuSbQn6AvisaZuug9=JTwM3QoG5mXy54r6-tXCg@mail.gmail.com>
Date: Fri, 21 Mar 2014 12:19:33 -0600
Message-ID: <CACwUX0MhB0x7+rQbB4VpobSDua_j2Wq_iiN2+1BWaHDmOLq2wg@mail.gmail.com>
Subject: Fwd: [PATCH] mtd: nand: fix byte addressing on 16-bit wide devices
From: David Mosberger-Tang <davidm@egauge.net>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Resend in plain text...

---------- Forwarded message ----------
From: David Mosberger-Tang <davidm@egauge.net>
Date: Fri, Mar 21, 2014 at 12:18 PM
Subject: Re: [PATCH] mtd: nand: fix byte addressing on 16-bit wide devices
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: David Mosberger <davidm@egauge.net>,
"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>


Ezequiel,

On Fri, Mar 21, 2014 at 12:05 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
>
>
> You can take a look at these commits:
>
> 3dad2344e92c6e1aeae42df1c4824f307c51bcc7
>
> AFAIK, the READID command data is now issued as 8-bit, disregarding of
> NAND_BUSWIDTH_16.
>
> Maybe you can re-test this building a kernel from linux-next.git and
> report if your issues are now fixed?


That's not sufficient.  GET_FEATURES and SET_FEATURES  also need
byte-addressing.

No offense, but my patch seems both simpler and more complete?

  --david
