Received: from inbox2.nyi.net ([64.147.100.114])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H3t1U-00066Z-DI
	for linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 06:50:47 -0500
Received: from imss.calsofthq.com (imss.calsofthq.com [172.16.0.44])
	by mail.calsofthq.com (8.13.6/8.13.6) with ESMTP id l08BnmMA001260
	for <linux-mtd@lists.infradead.org>; Mon, 8 Jan 2007 17:20:33 +0530
Received: from imss.calsofthq.com (localhost.localdomain [127.0.0.1])
	by localhost.calsofthq.com (Postfix) with ESMTP id 8CB74179CA4
	for <linux-mtd@lists.infradead.org>;
	Mon,  8 Jan 2007 17:19:48 +0530 (IST)
Received: from mail.calsofthq.com (mail.calsofthq.com [172.16.0.7])by
	imss.calsofthq.com (Postfix) with ESMTP id 80DCA179C9Ffor
	<linux-mtd@lists.infradead.org>; Mon,  8 Jan 2007 17:19:48 +0530 (IST)
Message-Id: <200701081149.l08BnQn5001183@mail.calsofthq.com>
From: "Vinit Agnihotri" <vinit.agnihotri@calsoftinc.com>
To: <linux-mtd@lists.infradead.org>
Subject: RE: max size of MTD?
Date: Mon, 8 Jan 2007 17:19:25 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070106085957.GA32684@pooky.senux.com>
Cc: 'Seongsu Lee' <senux@senux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

U have mentioned of creating 1 MTD device of 6GB by mtdconcat. However I am
curious to know how many mtd devices u've concatenated to make 6GB 
possible??? I am using mtdramm as test device but I am not able to allocate
memory over 1GB. So no question of having even more devices to make it above
5GB. Can you focus on the same question & help me. How can I allocate more
memory than 4GB??? Or how can I create 6GB MTD device.
My current test machine is AMD 64bit opteron with 1GB memory.

Thanks in advance.
Vinit.

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Seongsu Lee
Sent: Saturday, January 06, 2007 2:30 PM
To: linux-mtd@lists.infradead.org
Subject: Re: max size of MTD?

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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
