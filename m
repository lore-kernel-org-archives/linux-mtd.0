Received: from tele-post-20.mail.demon.net ([194.217.242.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M8wH-0007tA-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 15:01:34 +0100
Received: from eti-group.demon.co.uk ([212.228.32.244] helo=eti01.ntdomain01)
	by tele-post-20.mail.demon.net with esmtp (Exim 2.12 #2)
	id 15M91a-0003AY-0K
	for linux-mtd@lists.infradead.org; Mon, 16 Jul 2001 14:07:02 +0000
Message-ID: <CD62F9B6A488D31192A900105CAB276627DF35@ETI01>
From: David Mackay <dave.mackay@monitoreurope.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS (2) - File locking
Date: Mon, 16 Jul 2001 15:02:35 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,
=A0
We are beginning to develop a product using JFFS initially (possibly2 =
in
the future) and are using file locks in order to both write locally and
read remotely with a Java client front end. Currently on Ext2 our
program uses the system call lockf() which works well, however we read
with interest that JFFS does not support hard links and may have a
problem with this call!!? Any comments?
=A0
Thanks, David

EMC Website=A0=A0=A0=A0=A0 http://www.emc-environment.com=A0 =A0=A0 =
Real Time Air
Quality Info =A0=A0=A0 http://www.air-quality.net/

The information transmitted is intended only for the person or entity =
to
which it is addressed and may contain confidential and/or privileged
material. Any review, retransmission, dissemination or other use of, or
taking of any action in reliance upon, this information by persons or
entities other than the intended recipient is prohibited. If you
received this in error, please contact the sender and delete the
material from any computer.

=A0
