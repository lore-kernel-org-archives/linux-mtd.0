Received: from web30206.mail.mud.yahoo.com ([209.191.69.53])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IBgI6-0003Ew-CW
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 20:24:19 -0400
Date: Thu, 19 Jul 2007 17:17:36 -0700 (PDT)
From: Siddharth Choudhuri <siddh_c@yahoo.com>
Subject: Re: [RFC] sysfs support for mtd
To: dedekind@infradead.org
In-Reply-To: <1184828572.3531.183.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <97230.36289.qm@web30206.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > o I am not sure where an additional link from bus
> to
> > mtd should be added in the sysfs hierarchy. Should
> it
> > be /sys/bus/platform/devices ->
> ../../../devices/mtd
> > -OR-
> > /sys/bus/platform/ -> ../../devices/mtd 
> No idea, but I've always thought sysfs core
> automatically puts these
> links. All you have to do is to define your bus
> object which is
> "platform" bus, and the stuff will appear. Although
> I am not sure.
>  
Thanks for the suggestions. I added a link from
/sys/bus/platform/devices/mtd -> /sys/devices/mtd.
Link can be created in sysfs using a call to
sysfs_create_link() function.

I will send a patch after coding the suggestions and
running a few more tests. 

-sid



       
____________________________________________________________________________________
Need a vacation? Get great deals
to amazing places on Yahoo! Travel.
http://travel.yahoo.com/
