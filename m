Received: from mg02.austin.ibm.com ([192.35.232.12])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17adhl-0003oo-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 15:47:01 +0100
Received: from austin.ibm.com (netmail2.austin.ibm.com [9.3.7.139])
	by mg02.austin.ibm.com (AIX4.3/8.9.3/8.9.3) with ESMTP id JAA03748
	for <linux-mtd@lists.infradead.org>; Fri, 2 Aug 2002 09:47:56 -0500
Received: from popmail.austin.ibm.com (popmail.austin.ibm.com [9.53.247.178])
	by austin.ibm.com (AIX4.3/8.9.3/8.9.3) with ESMTP id JAA35296
	for <linux-mtd@lists.infradead.org>; Fri, 2 Aug 2002 09:46:52 -0500
Received: from mahi190.austin.ibm.com (mahi190.austin.ibm.com [9.3.154.190]) by popmail.austin.ibm.com (AIX4.3/8.9.3/8.7-client1.01) with ESMTP id JAA33988 for <linux-mtd@lists.infradead.org>; Fri, 2 Aug 2002 09:46:51 -0500
Subject: Re: "Read-only file system" error while writing
From: Stephen Hui <gromit1463@mailworks.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20020801233710.6be124a0.stuart.menefy@st.com>
References: <1028147069.12139.81.camel@mahi190.austin.ibm.com>
	<1028064443.23642.52.camel@mahi190.austin.ibm.com>
	<20020731163530.70c45960.stuart.menefy@st.com>
	<28851.1028197900@redhat.com>
	<20020801190500.7e73cf60.stuart.menefy@st.com>
	<20020801192624.28fe7b7e.stuart.menefy@st.com>
	<1028231145.22264.9.camel@mahi190.austin.ibm.com>
	<20020801233710.6be124a0.stuart.menefy@st.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 02 Aug 2002 09:46:23 -0500
Message-Id: <1028299583.23314.1.camel@mahi190.austin.ibm.com>
Mime-Version: 1.0
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

Looks like it worked, Stuart.  It's calling do_write_word() instead of
do_write_buffer().

Stephen.



On Thu, 2002-08-01 at 17:37, Stuart Menefy wrote:
> 
> This is not intended as a permanent fix, just to see if it fixes the problem.
> 
> Stuart
> 

-- 
"Find out what you've been missing while you've been
rebooting Windows NT." -- Infoworld on Linux

http://www.ao.com/~regan/penguins/tux.html
