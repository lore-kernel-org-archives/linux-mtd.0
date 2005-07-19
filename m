Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Duv2B-0003MT-PQ
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 12:33:42 -0400
Message-ID: <42DD2B50.1010601@mvista.com>
Date: Tue, 19 Jul 2005 09:33:20 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Nupur <nupurj@cdac.in>
References: <025701c58c45$1c6f3790$a26d01c4@nisg60b51cbee8>
In-Reply-To: <025701c58c45$1c6f3790$a26d01c4@nisg60b51cbee8>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: there is a change in previous post
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nupur wrote:
>
> I am trying to make Linux 2.6.10 work with MTD support. ...
> in function 'mtd_notify_add': undefined reference to 'class_device_create'
> in function 'mtd_notify_remove': undefined reference to
> 'class_device_destroy'
> in function 'init_mtdchar': undefined reference to 'class_create'
> in function 'cleanup_mtdchar': undefined reference to 'class_destroy'

The latest linux-mtd code matches the latest linux code, which obsoleted 
the previous "class_simple" interface in favor of the above interfaces 
recently.  Check the CVS logs and cvs diff the appropriate revision of 
mtdchar.c to find a reverse patch to put back the class_simple version. 
  Or googling Greg K-H's changes to convert class_simple will also show 
examples that can be reversed.


-- 
Todd
