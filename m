Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QrCG7-0001Tb-Ek
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2011 17:08:00 +0000
Received: by wwf10 with SMTP id 10so926497wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Aug 2011 10:07:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
	<e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
Date: Wed, 10 Aug 2011 10:07:53 -0700
Message-ID: <CAN8TOE-H9f9=DtamWPHTLbCJQBnGpeOJDtcXo18nkdC-d8WB7A@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd_debug: report ecc layout
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 9, 2011 at 1:57 PM, Ben Gardiner <bengardiner@nanometrics.ca> wrote:
> Add the ECC size and OOB available to that list. The other entries in the
> ecclayout struct are arrays and are not as meaningful as eccsize and oobavail.
> ---
> I noticed that the struct nand_ecclayout_user and its corresponding ioctl
> has been marked deprecated; however, since this is a 'debug' utility and at
> least one person found it useful I thought it would be a good idea to propose
> these changes anyways.

While I agree with your rationale for ignoring the deprecation (it's
OK for a debug utility), users of this feature should be warned that
struct nand_ecclayout_user will not report all information if there
are more ECC entries than "MTD_MAX_ECCPOS_ENTRIES" (i.e., 64). It will
simply truncate ECC at 64. This may be a problem for large page flash
with large ECC regions. It's a similar story for "oobavail" as well.

And before the question is asked, I'm not sure how to implement my
suggestion that "users of this feature should be warned". Perhaps just
a comment in the code?

Brian
