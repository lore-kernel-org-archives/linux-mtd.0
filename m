Received: from 208.101.48.4-static.reverse.softlayer.com ([208.101.48.4]
	helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GWR9C-0003LS-4a
	for linux-mtd@lists.infradead.org; Sun, 08 Oct 2006 06:24:22 +0100
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17704.37264.451830.145543@vaishnavi.localdomain>
Date: Sun, 8 Oct 2006 11:20:08 +0530
To: dedekind@infradead.org
Subject: Re: [PATCH 2/2] NAND: nandsim sector-wise allocation
In-Reply-To: <1160118496.13696.57.camel@sauron>
References: <17701.14724.377713.929566@vaishnavi.localdomain>
	<17701.15655.736379.98045@vaishnavi.localdomain>
	<1160118496.13696.57.camel@sauron>
From: Vijay Kumar <vijaykumar@bravegnu.org>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    Artem> I wonder, why "#if defined(kaka)" is better then "#ifdef
    Artem> kaka" ? What for is this change :-) ?

A kind of symmetry, since there is no #elifdef! :-) Anyway, the
#ifdefs are no longer required.

    >> +union ns_mem_t {
    >> +	u_char *byte;
    >> +	uint16_t *word;
    >> +};

    Artem> Minor, but 'union ns_mem' is a better name. We usually use
    Artem> "_t" for typedefs, and we use typedefs very rarely and only
    Artem> if there is a good reason.

Point taken.

    >> +static int
    >> +alloc_map_device(struct nandsim *ns)

    Artem> Again minor. I understand that everybody has its own style,
    Artem> and I appreciate this. But when one fixes an existing code,
    Artem> it makes sense to follow the same style. So I offer to use
    Artem> definitions like

Actually, the nandsim code uses this style! I used the same style to
be consistent with the nandsim code. I won't be fixing this in my
updated patch. Probably we could have a separate patch that fixes all
function definitions.

    Artem> Again a nit. We usually don't use brackets in case of
    Artem> one-line code - just a convention.

Point taken.

Thanks for the review Artem. Will send an updated patch shortly.

Regards,
Vijay

-- 
Free the Code, Free the User.
Website: http://www.bravegnu.org
