Received: from mail3.farm.elogic.it ([213.92.102.240])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NFqGh-0004OI-LV
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 14:33:28 +0000
Received: from [192.168.0.126]
	(host29-107-static.41-85-b.business.telecomitalia.it [85.41.107.29])
	by mail4.farm.elogic.it (eLogic Mail Server) with ASMTP id JAG11143
	for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2009 15:30:43 +0100
Message-ID: <4B167A11.6010407@imsitaly.com>
Date: Wed, 02 Dec 2009 15:30:41 +0100
From: Salvatore Frizzoli - IMS Italy <sfrizzoli@imsitaly.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: get mtd name and manufacturer from high level app
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am working on an application under a uClinux kernel.
This application would read name, manufacturer and id of the mtd flash 
device.
I have seen that it is not possible to do this by ioctl, so I don't know 
how to do.
I have also seen the get_mtd_device function, but i cannot know how to 
fill the
mtd_info struct that get_mtd_device takes as input parameter.

Is there a way to get theese infos similar to ioctl?

Thank you all.
Bye.
Salvatore

-- 
Salvatore Frizzoli

Software Developer

Research & Development Department
IMS srl

Via Sagittario, 5
Fraz. Pontecchio Marconi
40037 Sasso Marconi (BO)
Italy
Tel. ++39 051 846851
Fax ++39 051 846856 

http://www.imsitaly.com
