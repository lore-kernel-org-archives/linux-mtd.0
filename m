Received: from nf-out-0910.google.com ([64.233.182.184])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOl5I-00078l-0n
	for linux-mtd@lists.infradead.org; Tue, 06 Mar 2007 20:36:54 -0500
Received: by nf-out-0910.google.com with SMTP id a4so3767nfc
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Mar 2007 17:36:50 -0800 (PST)
Message-ID: <625fc13d0703061736t1a2fbddel7a80d04314136c1d@mail.gmail.com>
Date: Tue, 6 Mar 2007 19:36:49 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Johnson, Charles F" <charles.f.johnson@intel.com>
Subject: Re: JFFS2 Support for Large Flash Designs
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F17845FD5CF5@orsmsx413.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <B1EDF20A6EAAD74EA65E46F774F17845FD5CF5@orsmsx413.amr.corp.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/6/07, Johnson, Charles F <charles.f.johnson@intel.com> wrote:
> My understanding is that JFFS2 does not support flash file systems
> larger than 4GB.  What would be the issues with supporting more than 4GB
> of NAND flash.

Creating JFFS3.  Or LogFS.  Seriously.  And support in MTD for devices > 4GiB.

To support more than 4GiB, you need to change the internal variables
used to track sizes and offsets.  But as I said before, the log
structured nature of JFFS2 will present practical limits long before
4GiB because JFFS2 scales linearly.  Scanning a 1GiB JFFS2 filesystem
can already take minutes depending on various factors such as CPU
speed and filesystem utilization.

LogFS is under work to avoid these scaling issues as it doesn't
require a full scan of flash.  JFFS3, when it comes about, will do
something similar from what I understand.

josh
