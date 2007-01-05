Received: from nz-out-0506.google.com ([64.233.162.230])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H2jR7-0005hv-FK
	for linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 02:24:26 -0500
Received: by nz-out-0506.google.com with SMTP id i11so5132679nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Jan 2007 23:24:18 -0800 (PST)
Received: from pooky.senux.com (localhost.localdomain [127.0.0.1])
	by pooky.senux.com (8.13.7/8.13.7) with ESMTP id l057TfUp025856
	(version=TLSv1/SSLv3 cipher=DHE-DSS-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 5 Jan 2007 16:29:41 +0900
Received: (from senux@localhost)
	by pooky.senux.com (8.13.7/8.13.7/Submit) id l057Tfej025855
	for linux-mtd@lists.infradead.org; Fri, 5 Jan 2007 16:29:41 +0900
Date: Fri, 5 Jan 2007 16:29:41 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: max size of MTD?
Message-ID: <20070105072941.GA25342@pooky.senux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

What is the max size of a partition that can be used in MTD?
I found that the u_int32_t is used for the variable size 
in mtd_info. Then, I think 4GB is currently the max size. 
Am I right? 

I want to use 6GB flash memory with a partition. How can I 
fix it for using more than 4GB? I changed u_int32_t into
u_int64_t but it does not work. (kernel oops)


-- 
Seongsu's blog - http://www.senux.com/
"Besides, I think [Slackware] sounds better than
'Microsoft,' don't you?" (By Patrick Volkerding)
