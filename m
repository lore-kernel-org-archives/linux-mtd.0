Received: from smtp4.nedap.com ([213.160.213.85])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dskDP-0000ZL-UT
 for linux-mtd@lists.infradead.org; Fri, 15 Sep 2017 06:35:10 +0000
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Jaap de Jong <jaap.dejong@nedap.com>
Subject: ubi resize shrink volume
Message-ID: <f91150f4-8aff-1069-afaf-d602c4494fdc@nedap.com>
Date: Fri, 15 Sep 2017 08:34:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All!

I've seen a several (old) posts regarding this subject and I was 
wondering what the status at this moment is.

Is there any implementation available that is able to shrink a ubi 
volume, so that it will move used blocks at the end to the front?

Thanks in advance!

Jaap de Jong
