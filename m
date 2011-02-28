Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pu4vy-0003Q6-Mi
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2011 15:22:53 +0000
Received: by wwj40 with SMTP id 40so1659719wwj.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Feb 2011 07:22:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1102241445050.2784@lnxricardw.se.axis.com>
References: <AANLkTimPpD=M2pyfm3iV2Hbr61Jgzk8avMebN9LdYmyK@mail.gmail.com>
	<Pine.LNX.4.64.1102241445050.2784@lnxricardw.se.axis.com>
Date: Mon, 28 Feb 2011 20:52:19 +0530
Message-ID: <AANLkTi=Vq0NjLO2TqKADzF+pA++UroeKbGPg1Gzqpd+d@mail.gmail.com>
Subject: Re: Mean Time Between Failure - UBI clarifications
From: Navaneethan P <pnavanee@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Stefan.Bigler@keymile.com, navaneethan.p@aricent.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Sundararajan.Somasundaram@aricent.com, Shenbaga.Nathan@aricent.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you for your response.

On Thu, Feb 24, 2011 at 7:34 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
> mtd supplies statistics counters that might help. For each mtd partition
> there is one counter which is increased every time a read operation requires
> ECC to correct a bit (i.e. a correctable single bit error), and one counter
> for ECC failures (two-bit errors).

I checked the mtd directory of sysfs and also the source code of mtd.
However I could not find the mtd statistics counter from the available
source mtd-2.6.28. Could you please guide me as to where the
statistics counters are implemented inside mtd source.

Thanks and Regards,
Navaneethan P
