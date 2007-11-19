Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iu2rn-0004YK-3m
	for linux-mtd@lists.infradead.org; Mon, 19 Nov 2007 04:24:38 -0500
Received: by wa-out-1112.google.com with SMTP id v33so1823319wah
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Nov 2007 01:24:29 -0800 (PST)
Message-ID: <9b52d64c0711190124p6730356ep3b0c7a381863a905@mail.gmail.com>
Date: Mon, 19 Nov 2007 14:54:29 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Yet Another UBI Question
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F1784502B9D207@orsmsx413.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <B1EDF20A6EAAD74EA65E46F774F1784502B64384@orsmsx413.amr.corp.intel.com>
	<B1EDF20A6EAAD74EA65E46F774F1784502B9D207@orsmsx413.amr.corp.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
As a part of work I have work with UBI & character drivers i.e. cdev.c in UBI.
Can we think of implementing block device drivers instead of cdev to
implement volume?
That way we'll not be needing any block emulation layer on top of
volume cdev & user will be able to
put any file system on top of it.
Will it complicate volume management or wear levelling anyway????

--Vinit.

On Oct 25, 2007 4:09 AM, Johnson, Charles F <charles.f.johnson@intel.com> wrote:
>  Is there exist yet a block driver which sits on top of UBI so that you
> could use one of the traditional file systems such as ext3 or vfat?
>
>
> Charles Johnson
> Ultra-Mobility Group
> Platform Software Engineering
> Intel Corporation
> charles.f.johnson@intel.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



-- 
Life is so short. So, follow some rules. Forgive quickly, believe
slowly, love truly, laugh loudly & never avoid anything that makes U
smile.
