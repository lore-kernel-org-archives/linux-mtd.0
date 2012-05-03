Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPsLq-0002ON-2j
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 09:29:30 +0000
Received: by lbbgg6 with SMTP id gg6so1373031lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 02:29:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1336024908.2056.3.camel@koala>
References: <1335951710-9390-1-git-send-email-hechtb@gmail.com>
 <1335951710-9390-3-git-send-email-hechtb@gmail.com>
 <201205022249.30426.rjw@sisk.pl> <1336024825.2056.2.camel@koala>
 <1336024908.2056.3.camel@koala>
Date: Thu, 3 May 2012 11:29:26 +0200
Message-ID: <CABYn4szWZP4zZcz1MJ1xk5oCxiWh0nyJczcHGUqw4wE5MfJunA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] ARM: sh-mobile: mackerel: Add error IRQ resource
From: Bastian Hecht <hechtb@googlemail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec554d8eca083eb04bf1e7045
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 "Rafael J. Wysocki" <rjw@sisk.pl>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--bcaec554d8eca083eb04bf1e7045
Content-Type: text/plain; charset=ISO-8859-1

Am 03.05.2012 08:01 schrieb "Artem Bityutskiy" <dedekind1@gmail.com>:
>
> On Thu, 2012-05-03 at 09:00 +0300, Artem Bityutskiy wrote:
> > On Wed, 2012-05-02 at 22:49 +0200, Rafael J. Wysocki wrote:
> > > On Wednesday, May 02, 2012, Bastian Hecht wrote:
> > > > Supply the platform data for the FLSTEI error IRQ.
> > > >
> > > > Signed-off-by: Bastian Hecht <hechtb@gmail.com>
> > >
> > > I'm going to take this patch into the renesas.git tree and push it
> > > upstream throuch arm-soc, if that's not a problem.
> >
> > It is already in the MTD tree with the rest of the 10 patches...
>
> Ops, sorry, this is not true. Then Bastian should separate it out and
> not send it to the MTD tree.

Alright I'll do. I need to fix the compiler warnings of the mtd patches
anyway. So the board code is independant and can be pushed already by
Rafael, right? How is it supposed to work in general? I think the sh-mobile
list wants to be informed when I change something in the flctl code. Would
the right approach be to send 2 patchsets - posted on both MLs so that
Artem can take the mtd portions and Rafael the mackerel ones?

Best regards,

Bastian Hecht

> --
> Best Regards,
> Artem Bityutskiy

--bcaec554d8eca083eb04bf1e7045
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
Am 03.05.2012 08:01 schrieb &quot;Artem Bityutskiy&quot; &lt;<a href=3D"mai=
lto:dedekind1@gmail.com">dedekind1@gmail.com</a>&gt;:<br>
&gt;<br>
&gt; On Thu, 2012-05-03 at 09:00 +0300, Artem Bityutskiy wrote:<br>
&gt; &gt; On Wed, 2012-05-02 at 22:49 +0200, Rafael J. Wysocki wrote:<br>
&gt; &gt; &gt; On Wednesday, May 02, 2012, Bastian Hecht wrote:<br>
&gt; &gt; &gt; &gt; Supply the platform data for the FLSTEI error IRQ.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Bastian Hecht &lt;<a href=3D"mailto:hech=
tb@gmail.com">hechtb@gmail.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m going to take this patch into the renesas.git tree a=
nd push it<br>
&gt; &gt; &gt; upstream throuch arm-soc, if that&#39;s not a problem.<br>
&gt; &gt;<br>
&gt; &gt; It is already in the MTD tree with the rest of the 10 patches...<=
br>
&gt;<br>
&gt; Ops, sorry, this is not true. Then Bastian should separate it out and<=
br>
&gt; not send it to the MTD tree.</p>
<p>Alright I&#39;ll do. I need to fix the compiler warnings of the mtd patc=
hes anyway. So the board code is independant and can be pushed already by R=
afael, right? How is it supposed to work in general? I think the sh-mobile =
list wants to be informed when I change something in the flctl code. Would =
the right approach be to send 2 patchsets - posted on both MLs so that Arte=
m can take the mtd portions and Rafael the mackerel ones?</p>

<p>Best regards,</p>
<p>Bastian Hecht</p>
<p>&gt; --<br>
&gt; Best Regards,<br>
&gt; Artem Bityutskiy<br>
</p>

--bcaec554d8eca083eb04bf1e7045--
