Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAL7Z-0004Hl-CX
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 11:54:02 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'dedekind1@gmail.com'" <dedekind1@gmail.com>
Date: Thu, 14 Apr 2011 07:53:59 -0400
Subject: RE: I don't understand how the counter for erasures is being
	maintained during erase failures
Message-ID: <0A40042D85E7C84DB443060EC44B3FD328119F6E8A@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD328119F6E7D@dekaexchange07.deka.local>
	<1302765211.2796.13.camel@localhost>
	<0A40042D85E7C84DB443060EC44B3FD328119F6E88@dekaexchange07.deka.local>
	<1302780914.2796.18.camel@localhost>
In-Reply-To: <1302780914.2796.18.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem:

> BTW, in case you did not read that:
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

  Oh yes, here in my shop, we've read that!
  Too late, perhaps ;-), but we've read that!
  But just like disclaimers automatically
  included in E-mail messages, we live with
  what we have and not what we wish we had!

                        Atlant

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
Sent: Thursday, April 14, 2011 07:35
To: Atlant Schmidt
Cc: 'linux-mtd@lists.infradead.org'
Subject: RE: I don't understand how the counter for erasures is being maint=
ained during erase failures

On Thu, 2011-04-14 at 06:53 -0400, Atlant Schmidt wrote:
> Artem:
>
> > What is the flash? Is it MLC?
>
> Today, unfortunately, yes, although our newest board
> revisions have switched to SLC and we're retrofitting
> the older boards as we can. But some of our systems
> will be living with MLC for a while yet.

BTW, in case you did not read that:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

--
Best Regards,
Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)


This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
