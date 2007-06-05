Received: from mail128.messagelabs.com ([216.82.250.131])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvZux-0006jO-Vw
	for linux-mtd@lists.infradead.org; Tue, 05 Jun 2007 10:22:02 -0400
Received: from il06exr03.mot.com (il06exr03.mot.com [129.188.137.133])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id l55ELn6r005437
	for <linux-mtd@lists.infradead.org>;
	Tue, 5 Jun 2007 07:21:49 -0700 (MST)
Received: from il06vts03.mot.com (il06vts03.mot.com [129.188.137.143])
	by il06exr03.mot.com (8.13.1/Vontu) with SMTP id l55ELmko018712
	for <linux-mtd@lists.infradead.org>;
	Tue, 5 Jun 2007 09:21:49 -0500 (CDT)
Received: from de01exm63.ds.mot.com (de01exm63.am.mot.com [10.176.8.108])
	by il06exr03.mot.com (8.13.1/8.13.0) with ESMTP id l55ELmu9018703
	for <linux-mtd@lists.infradead.org>;
	Tue, 5 Jun 2007 09:21:48 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: JFFS2 deadlock with alloc_sem
Date: Tue, 5 Jun 2007 10:21:38 -0400
Message-ID: <F0A7A3D5461CB54F878D218854074FCE02166502@de01exm63.ds.mot.com>
In-Reply-To: <1180806125.25232.134.camel@pmac.infradead.org>
References: <F0A7A3D5461CB54F878D218854074FCE01F7425F@de01exm63.ds.mot.com>
	<1180806125.25232.134.camel@pmac.infradead.org>
From: "Roberts Nathan-mcg31137" <Nathan.Roberts@motorola.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Has anyone seen this deadlock before? It seems to be a classic=20
> > deadlock situation so I'm not sure if maybe I'm misinterpreting
things=20
> > or the use case (several postmark tests running in parallel on a=20
> > preemptible kernel) is especially vulnerable.
>
> I think Josh has spotted the real problem here. Does this help? If so,
as better fix will be forthcoming....

Thanks for the information. We tried the suggested modification and it
actually makes it much easier to reproduce the problem (so on one hand
it's a good thing.)

The steps we are using are:
1) Start postmark tests (usually 1 copy is sufficient but it is a little
easier to reproduce with multiple tests in parallel)
2) Wait for filesystem to get around 90% full=20
3) Kill postmark (simple CTRL-C)
4) If filesystem is 100% full, delete postmark working directories
4) Restart postmark
5) goto 2

Normally within just a few iterations, we hang.
