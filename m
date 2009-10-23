Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1CcS-0005wi-Kp
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 05:23:25 +0000
Subject: Re: [PATCH v5 2/3] MTD: OneNAND: multiblock erase support
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: "Korhonen Mika.2 (EXT-Ardites/Oulu)" <ext-mika.2.korhonen@nokia.com>
In-Reply-To: <4AE13CFA.7080703@nokia.com>
References: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-3-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4ADDB69F.7060606@nokia.com> <1256272454.29885.198.camel@localhost>
	<4AE13CFA.7080703@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Oct 2009 08:22:46 +0300
Message-Id: <1256275366.29885.214.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-23 at 07:19 +0200, Korhonen Mika.2 (EXT-Ardites/Oulu)
wrote:
> Bityutskiy Artem (Nokia-D/Helsinki) wrote:
> > On Tue, 2009-10-20 at 16:09 +0300, Adrian Hunter wrote:
> >   
> >> Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
> >>     
> >>> Add support for multiblock erase command. OneNANDs (excluding Flex-OneNAND)
> >>> are capable of simultaneous erase of up to 64 eraseblocks which is much faster.
> >>>
> >>> This changes the erase requests for regions covering multiple eraseblocks
> >>> to be performed using multiblock erase.
> >>>
> >>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
> >>> ---
> >>>       
> >> Just a comment about fail_addr
> >>     
> >
> > Mika, are you planning to amend this and re-send?
> >
> >   
> Yes, sorry been quite busy  lately. Shall I resend this very patch with 
> Adrian's improvements to this thread only or mail the whole set again.

Up to you. I can pick them up both ways.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
