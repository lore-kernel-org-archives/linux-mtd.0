Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEe1A-0007hL-JB
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 08:53:13 +0000
Received: by ewy3 with SMTP id 3so130923ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 01:53:10 -0700 (PDT)
Subject: Re: Programming ubinized images
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTi=cHfoxmA_n2ttzR5=pacRgNX48BA@mail.gmail.com>
References: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
	<1303804811.2778.37.camel@localhost>
	<BANLkTi=cHfoxmA_n2ttzR5=pacRgNX48BA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 11:49:36 +0300
Message-ID: <1303807776.2778.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-26 at 04:48 -0400, Matthew L. Creech wrote:
> 
> Makes sense.  I might take a stab at this later this week, since it
> sounds like something along these lines is required if we plan to use
> an industrial (fairly dumb) NAND programmer to flash ubinized UBIFS
> images. 

Yeah, we were able to modify the production flasher so it dropped
all-0xFF NAND pages, and we did not foresee that this might be a problem
of others.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
