Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIB6o-0006kv-6B
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2011 03:21:55 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Daniel Wagener <daniel.wagener@kernelconcepts.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Mon, 24 Oct 2011 04:21:48 +0100
Subject: RE: Subject: UBIFS and small dynamic files
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0BF2402CFE@Cloud.RL.local>
In-Reply-To: <4EA1823D.3040708@kernelconcepts.de>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
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

You need to rewrite files with safe POSIX semantics.
It is not crash-safe to rewrite the target file directly (but many
apps are naive and do this in an unsafe way)

The right way to do it is write a new file on the same filesystem,
fsync() it, then rename it over the target. The rename is atomic
so after a crash you either get the old file or the new one.

I had a quick google for the authoritative sequence but I couldn't
find and can't remember it exactly. I think it might involve an fsync
on the directory handle too if you want to be sure the new file has
arrived on flash. This avoids syncing the entire filesystem
or mounting it -o sync.

linux-mtd-bounces@lists.infradead.org wrote:
> Ahoi,
>
> we are having trouble with the side effects of the UBIFS write buffer
> described in
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writebuffer
> We have certain config files that are quite small and get
> rewritten very
> frequently by their applications.
> Matchbox-panels' ~/.matchbox/mbdock.session is a fine example
> as it gets
> emptied on a power cut or hard reset resulting in an empty
> and therefore
> useless panel on the next start.
>
> The document above mentions the '-o sync' option which disables the
> write buffer on a partition, but this is not an option for us because
> we do not want to reduce the write performance. And there is
> also the issue
> of a synchronously mounted UBIFS that can make things even
> worse in case
> of power cuts.
>
>
>
> Has there been any further development to these issues since 2008?
>
>

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> -----
> No virus found in this message.
> Checked by AVG - www.avg.com
> Version: 10.0.1411 / Virus Database: 1522/3970 - Release
> Date: 10/23/11



--
Jon Povey
jon.povey@racelogic.co.uk
