Received: from mail.irisgmbh.de ([81.169.172.79])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMcZy-0003iF-C0
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 13:48:31 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.irisgmbh.de (Postfix) with ESMTP id 568BCFF80772
 for <linux-mtd@lists.infradead.org>; Tue,  4 Aug 2015 15:47:41 +0200 (CEST)
Received: from mail.irisgmbh.de ([127.0.0.1])
 by localhost (s15324379.rootmaster.info [127.0.0.1]) (amavisd-new, port 10027)
 with ESMTP id vDS4WLwVovDj for <linux-mtd@lists.infradead.org>;
 Tue,  4 Aug 2015 15:47:41 +0200 (CEST)
Received: from ERDE.irisgmbh.local (port-83-236-156-18.static.qsc.de
 [83.236.156.18])
 by mail.irisgmbh.de (Postfix) with ESMTP id 3D8FBFF805EA
 for <linux-mtd@lists.infradead.org>; Tue,  4 Aug 2015 15:47:41 +0200 (CEST)
From: iris Christian Klemke <Christian.Klemke@irisgmbh.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Lisensing questions
Date: Tue, 4 Aug 2015 13:47:40 +0000
Message-ID: <0D51A477944EA44BA3616A7D2CAB53CA0952EAE5@ERDE.irisgmbh.local>
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a question regarding the GPL implications in a somewhat special case=
.
What I would like to do is to take the JFFS2 source code and port it to a c=
losed-source real-time kernel named VDK (by Analog Devices), by a combinati=
on of source code modifications and/or provision of an emulation layer for =
the relevant Linux subsystems (like MTD).
My understanding of the GPL is that I would be this would usually oblige me=
 to publish the resulting source codes under the GPL as well. So far, so go=
od. However, I suspect the implications of the GPL license might not stop t=
here because the VDK is not a full operating system on which our applicatio=
n runs. Instead, it is a kernel which gets linked with the application code=
 into one monolithic firmware image. So in case of the VDK the separation b=
etween operating system and application, which would usually also be a "bar=
rier" for the GPL, does not exist. Nonetheless a separation would exist in =
architectural terms, because the JFFS2 integration would be coded against t=
he VDK filesystem driver interface while the application would not call any=
 JFFS2-related code directly but only rely on the standard C file API that =
is offered by the VDK and its C-runtime library.
So, the big question is: would a JFFS2 integration as outlined above requir=
e the publication of the whole application source code under the GPL along =
with the VDK-integration part in this scenario ? Or would the GPL obligatio=
ns be limited to the code related to the integration of JFFS2 into VDK ?
A related question is: what if I create an independent implementation of JF=
FS2 by implementing its concepts/functionality from scratch writing my own =
code ? Would the GPL still apply ?

Thank you for any kind of enlightenment.
Kind regards,

Christian Klemke
Developer
iris-GmbH, Berlin/Germany

Tel. +49 30 58 58 14 261
Fax +49 30 58 58 14 999
christian.klemke@irisgmbh.de
. . . . . . . . . . . . . . . . . . . . . . . . . .=20
iris-GmbH
infrared & intelligent sensors
Ostendstra=DFe 1-14 | 12459 Berlin
Gesch=E4ftsf=FChrer
A. Thun | R. B=F6nick=20
Amtsgericht Berlin-Charlottenburg
HRB 41 448 | USt-ID-Nr. DE 137228225
www.irisgmbh.de
