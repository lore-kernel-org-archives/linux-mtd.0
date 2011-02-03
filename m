Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pl12e-0001Yx-5m
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 15:24:17 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=iso-8859-1
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
Date: Thu, 3 Feb 2011 10:24:59 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 3, 2011, at 4:50 AM, Joakim Tjernlund wrote:

>>> My failures were caused by the erase-resume status read "seeing" a =
non-busy WSM. Adding a 20=B5s delay before that read (actually after the =
command write, but it amounts to the same thing) prevents this from =
happening. By the time awakened "wait-for-completion" code does its =
first status read it sees the WSM as busy as it should until the erase =
actually finishes.
>=20
> Perhaps you can test for ESS(SR.6) too?
> something like:
>  if DWS && !ESS

Hmmm. So instead of a blind delay it would loop (with a timeout) while =
DWS && ESS are both set (meaning the erase resume command just written =
hasn't yet taken effect). It does make sense that if the resume takes =
time to drop SR.7 (ready) that it would also take time to drop SR.6 =
(ESS).

I like that. I'll add that to the set of tests today and report back.

-Mike
