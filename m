Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bewV-0003ER-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 11:18:27 +0100
Message-ID: <01c201c23c69$7995faa0$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <tglx@linutronix.de>, <linux-mtd@lists.infradead.org>,
   "? ??" <djh@gv.com.tw>, <cms@gv.com.tw>
References: <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw>  <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de> <001001c23957$3a290520$1b0448c0@gv.com.tw>  <28541.1028541296@redhat.com>
Subject: Re: error when writing to jffs2 (scan.c v1.79 20020725)
Date: Mon, 5 Aug 2002 18:18:42 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
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

scan.c v 1.79 20020725

/*
 * JFFS2 -- Journalling Flash File System, Version 2.
 *
 * Copyright (C) 2001, 2002 Red Hat, Inc.
 *
 * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
 *
 * For licensing information, see the file 'LICENCE' in this directory.
 *
 * $Id: scan.c,v 1.79 2002/07/25 20:48:51 dwmw2 Exp $
 *
 */

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "??" <kevin@gv.com.tw>
Cc: <tglx@linutronix.de>; <linux-mtd@lists.infradead.org>; "? ??"
<djh@gv.com.tw>; <cms@gv.com.tw>
Sent: Monday, August 05, 2002 5:54 PM
Subject: Re: error when writing to jffs2


>
> kevin@gv.com.tw said:
> >  error when writing to jffs2 any idea?
>
> What version of fs/jffs2/scan.c do you have?
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
