Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHEgC-0004p4-RU
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:54:01 +0000
Received: by bwz5 with SMTP id 5so3971234bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 03:53:59 -0800 (PST)
Subject: Re: [PATCH v2 09/10] mtd-utils: nandwrite: full 64-bit support w/
	libmtd
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1289457554-24155-1-git-send-email-computersforpeace@gmail.com>
References: <AANLkTimUr8Dvmz7=Owk9dEgWt7hdTFFT+NDXczWd9DfV@mail.gmail.com>
	<1289457554-24155-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 13:53:47 +0200
Message-ID: <1289649227.2218.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-11-10 at 22:39 -0800, Brian Norris wrote:
> Several ioctls are replaced with libmtd calls which should give us 64-bit
> support for large devices. libmtd mostly provides drop-in replacements
> for the functionality we need. However, when we require erasure of a
> badly-written block, mtd_erase() only erases a single block, whereas
> MEMERASE could erase a larger region. In nandwrite, we may have a "virtual
> blocksize" of more than one (when blockalign > 1). Thus, I added a loop
> for this case.

You could as well just introduce another libmtd helper - would be
cleaner, IMO.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
