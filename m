Received: from zproxy.gmail.com ([64.233.162.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZ4YF-0007Pa-Mf
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 05:48:39 -0500
Received: by zproxy.gmail.com with SMTP id i1so283823nzh
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Nov 2005 02:48:34 -0800 (PST)
Message-ID: <cda58cb80511070248o6d7a18bex@mail.gmail.com>
Date: Mon, 7 Nov 2005 11:48:34 +0100
From: Franck <vagabon.xyz@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: How can I prevent MTD to access the end of a flash device ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have two questions that I can't answer by my own. I tried to look at
FAQ and documentation on MTD website but found no answer.

First question is about size of flash. I have a Intel strataflash
whose size is 32MB but because of a buggy platform hardware I can't
access to the last 64KB of the flash. How can I make MTD module aware
of this new size. The restricted map size is initialized by my driver
but it doesn't seem to be used by MTD.

The second question is about the "cacheable" mapping field in map_info
structure. I looked at others drivers and this field seems to be
optional. Does this field, if set, improve flash access a lot ? Should
I set up a cacheable mapping ?

Thanks
--
               Franck

PS: could you CC me in your answer since I'm not subscribed to the list
