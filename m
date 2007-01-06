Received: from nz-out-0506.google.com ([64.233.162.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H37ST-0003wM-Mx
	for linux-mtd@lists.infradead.org; Sat, 06 Jan 2007 04:03:26 -0500
Received: by nz-out-0506.google.com with SMTP id i11so5505910nzi
	for <linux-mtd@lists.infradead.org>;
	Sat, 06 Jan 2007 01:03:17 -0800 (PST)
Received: from pooky.senux.com (localhost.localdomain [127.0.0.1])
	by pooky.senux.com (8.13.7/8.13.7) with ESMTP id l068xvVs000359
	(version=TLSv1/SSLv3 cipher=DHE-DSS-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Sat, 6 Jan 2007 17:59:58 +0900
Received: (from senux@localhost)
	by pooky.senux.com (8.13.7/8.13.7/Submit) id l068xvem000358
	for linux-mtd@lists.infradead.org; Sat, 6 Jan 2007 17:59:57 +0900
Date: Sat, 6 Jan 2007 17:59:57 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: Re: max size of MTD?
Message-ID: <20070106085957.GA32684@pooky.senux.com>
References: <20070105072941.GA25342@pooky.senux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070105072941.GA25342@pooky.senux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 05, 2007 at 04:29:41PM +0900, Seongsu Lee wrote:
> Hi,
> 
> What is the max size of a partition that can be used in MTD?
> I found that the u_int32_t is used for the variable size 
> in mtd_info. Then, I think 4GB is currently the max size. 
> Am I right? 
> 
> I want to use 6GB flash memory with a partition. How can I 
> fix it for using more than 4GB? I changed u_int32_t into
> u_int64_t but it does not work. (kernel oops)

Hi,

I changed the type of variable size in structure mtd_info 
from u_int32_t to u_int64_t. Some code such as printk is
modified after the change. It works. I tested that 
mtdconcat can create 6GB MTD device as one device.

-- 
Seongsu's blog - http://www.senux.com/
The aim of a joke is not to degrade the human being
but to remind him that he is already degraded. --
George Orwell
