Received: from web11101.mail.yahoo.com ([216.136.131.148])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MCt3-0002Tf-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2002 18:46:46 +0000
Message-ID: <20020103185739.83836.qmail@web11101.mail.yahoo.com>
Date: Thu, 3 Jan 2002 10:57:39 -0800 (PST)
From: Sheela Kashyap <sheela_kashyap@yahoo.com>
Subject: Re: (no subject) 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <5660.1010049962@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

The utilities had already been downloaded by someone else. I am not
sure where they got the package from. I will download the mtd-utils
package again and build the image. 

The 'Id' string in the mkfs.jffs.c file is as follows:

$Id: mkfs.jffs.c,v 1.11 2001/03/11 11:44:42 dwmw2 Exp $

Sheela.

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> sheela_kashyap@yahoo.com said:
> > Hmm... I will try mkfs.jffs again in that case.  
> 
> If it fails, can you cut down the directory tree you're putting
> into the
> JFFS image to the smallest testcase that shows the problem (like
> the /dev
> directory and a single device node), then send me both a tarball
> and the
> JFFS image of it?
> 
> Where did you get your mkfs.jffs from? 
> 
> --
> dwmw2
> 
> 


__________________________________________________
Do You Yahoo!?
Send your FREE holiday greetings online!
http://greetings.yahoo.com
