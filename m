Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMfXz-0006td-EW
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 16:58:39 +0000
Received: by obnw1 with SMTP id w1so11742946obn.3
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2015 09:58:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0D51A477944EA44BA3616A7D2CAB53CA0952EAE5@ERDE.irisgmbh.local>
References: <0D51A477944EA44BA3616A7D2CAB53CA0952EAE5@ERDE.irisgmbh.local>
Date: Tue, 4 Aug 2015 18:58:17 +0200
Message-ID: <CAFLxGvwozcZAP+7+6y_8UxyLKraYrA7=txure=L5xd2yDUaD1w@mail.gmail.com>
Subject: Re: Lisensing questions
From: Richard Weinberger <richard.weinberger@gmail.com>
To: iris Christian Klemke <Christian.Klemke@irisgmbh.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 4, 2015 at 3:47 PM, iris Christian Klemke
<Christian.Klemke@irisgmbh.de> wrote:
> Hi,
>
> I have a question regarding the GPL implications in a somewhat special ca=
se.
> What I would like to do is to take the JFFS2 source code and port it to a=
 closed-source real-time kernel named VDK (by Analog Devices), by a combina=
tion of source code modifications and/or provision of an emulation layer fo=
r the relevant Linux subsystems (like MTD).
> My understanding of the GPL is that I would be this would usually oblige =
me to publish the resulting source codes under the GPL as well. So far, so =
good. However, I suspect the implications of the GPL license might not stop=
 there because the VDK is not a full operating system on which our applicat=
ion runs. Instead, it is a kernel which gets linked with the application co=
de into one monolithic firmware image. So in case of the VDK the separation=
 between operating system and application, which would usually also be a "b=
arrier" for the GPL, does not exist. Nonetheless a separation would exist i=
n architectural terms, because the JFFS2 integration would be coded against=
 the VDK filesystem driver interface while the application would not call a=
ny JFFS2-related code directly but only rely on the standard C file API tha=
t is offered by the VDK and its C-runtime library.
> So, the big question is: would a JFFS2 integration as outlined above requ=
ire the publication of the whole application source code under the GPL alon=
g with the VDK-integration part in this scenario ? Or would the GPL obligat=
ions be limited to the code related to the integration of JFFS2 into VDK ?

Please consult a lawyer.
Don't expect anyone of us to help you bypassing the GPL.

> A related question is: what if I create an independent implementation of =
JFFS2 by implementing its concepts/functionality from scratch writing my ow=
n code ? Would the GPL still apply ?

You're free to do with your own code what you want.
If you fear patents, again, consult a lawyer.

--=20
Thanks,
//richard
