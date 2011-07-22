Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QkDJ9-0003Mm-EE
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2011 10:50:16 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'dedekind1@gmail.com'" <dedekind1@gmail.com>
Date: Fri, 22 Jul 2011 06:50:12 -0400
Subject: RE: Can major re-organization activities of the UBIfs be
	"deliberately provoked"?
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A7208F982@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD32A7208F97E@dekaexchange07.deka.local>
	<1311323646.20707.18.camel@sauron>
In-Reply-To: <1311323646.20707.18.camel@sauron>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

  Thanks! We've already tuned the Linux page cache
  to be quite a lot less bursty (for example, by
  decreasing the dirty_expire_centisecs from 3000
  (30 seconds) to 500 (5 seconds); this substantially
  removed the burstiness associated with the VFS
  (and the associated pagecache flushing tasks).

  Now, though, we assume we're up against garbage
  collection in the UBIfs so we wonder if there's
  a way to make *THAT* operation either:

    1. Less bursty (perhaps by making it run more
       often but have less work to do at each run),
       or

    2. Externally schedulable so we could cause it
       to occur when we have idle CPU time and its
       running won't affect the realtime behavior
       of the rest of our system.

  Can either of those things be done?

                            Atlant

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
Sent: Friday, July 22, 2011 04:34
To: Atlant Schmidt
Cc: 'linux-mtd@lists.infradead.org'
Subject: Re: Can major re-organization activities of the UBIfs be "delibera=
tely provoked"?

On Thu, 2011-07-21 at 09:33 -0400, Atlant Schmidt wrote:
> Folks:
>
>   We're using the UBIfs with our realtime equipment. We've
>   noticed a behavior where, every so often, the flush-ubifs
>   thread demands very, very large amounts of CPU time, blocking
>   all of our other processes that use the Linux time-sliced
>   scheduler. These bursts come at arbitrary intervals but
>   commonly last ten to fifteen seconds.

If the bursts are probably dues to write-back which is initiated by VFS.
When UBIFS is doing write-back it needs to compress data, it may need to
do GC if there is not space.

First - check if the bursts are indeed about write-back - change the
period of write-back and see. Or type sync and see the utilization. Then
you can play with VFS knobs and lessen the write-back intervals
in /proc.


--
Best Regards,
Artem Bityutskiy


This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
