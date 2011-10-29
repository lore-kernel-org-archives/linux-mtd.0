Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKEp2-0007fl-IJ
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 19:44:05 +0000
Received: by bke11 with SMTP id 11so2664411bke.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Oct 2011 12:44:01 -0700 (PDT)
Subject: RE: UBIFS recovery fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Sat, 29 Oct 2011 22:43:50 +0300
In-Reply-To: <Pine.LNX.4.64.1110240857490.30940@lnxricardw.se.axis.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
	<1319129028.20953.26.camel@sauron>
	<Pine.LNX.4.64.1110240857490.30940@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1319917436.2126.0.camel@koala>
Mime-Version: 1.0
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?Jean-S=E9bastien?= Gagnon <jsgagnon@vizimax.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-10-24 at 09:00 +0200, Ricard Wanderlof wrote:
> How would UBI+ubifs compare to jffs2 in this respect? I would naïvely 
> assume that since jffs2 doesn't do any scrubbing, it would just return ok 
> if the data happened to be read correctly that time, and something like an 
> I/O error if the data was faulty, but without taking any special action in 
> that case?

Yes, I think so.

Artem.
