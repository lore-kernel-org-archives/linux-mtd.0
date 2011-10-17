Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFlUe-0006Sr-Ce
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 11:36:33 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>, "'dedekind1@gmail.com'"
	<dedekind1@gmail.com>
Date: Mon, 17 Oct 2011 07:36:28 -0400
Subject: RE: ubi vol_size and lots of bad blocks
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33001C1D745@dekaexchange07.deka.local>
References: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
	<0A40042D85E7C84DB443060EC44B3FD33001C1D733@dekaexchange07.deka.local>
	<1318597112.12351.123.camel@sauron>
	<0A40042D85E7C84DB443060EC44B3FD33001C1D742@dekaexchange07.deka.local>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD33001C1D742@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	'Daniel Drake' <dsd@laptop.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem:

  Thanks for the prompt -- our subject-matter expert
  says that yes, this was a bug that has now been
  corrected!
                         Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Atlant Schmidt
Sent: Friday, October 14, 2011 09:03
To: 'dedekind1@gmail.com'
Cc: linux-mtd@lists.infradead.org; 'Daniel Drake'
Subject: RE: ubi vol_size and lots of bad blocks

Artem:

  Interesting! I'll ask our subject-matter expert;
  it would be great if this were resolved.

                          Atlant

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
Sent: Friday, October 14, 2011 08:58
To: Atlant Schmidt
Cc: 'Daniel Drake'; linux-mtd@lists.infradead.org
Subject: RE: ubi vol_size and lots of bad blocks

On Tue, 2011-10-11 at 07:35 -0400, Atlant Schmidt wrote:
>
>   Be careful here -- the last time I looked, blocks that go
>   bad *ARE NOT* actually permanently marked as bad; they may
>   no longer be used during the current boot, but the next time
>   you reboot, they're eligible for attempted-but-often-failing
>   use once again.

If this happened to you, this must be because of a bug in your MTD
driver. UBI dimply calls MTD mark_bad() function to mark blocks bad.

--
Best Regards,
Artem Bityutskiy



 Click https://www.mailcontrol.com/sr/fue6KqaG!5rTndxI!oX7Us7Qlo!t9IHt!Dknk=
v+q9bergxmG63nRctGYsfIhXbFK16EEqwzvaW+2eN6FcXjHgg=3D=3D  to report this ema=
il as spam.

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
