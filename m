Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13A6Pg-0005X7-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 08:49:36 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13A6PW-0005W3-00
	for mtd@infradead.org; Thu, 06 Jul 2000 08:49:30 +0100
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="IZZF9RdRGW"
Content-Transfer-Encoding: 7bit
Date: Thu,  6 Jul 2000 10:46:20 +0300 (IDT)
To: MTD <mtd@infradead.org>
Subject: forwarded message from Dvir Oren
Message-ID: <14692.14637.593403.586193@jodie.lucid>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--IZZF9RdRGW
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Sorry - I'm sending as an attachemtn.  I'm having a bit of problems
with my mail server.


--IZZF9RdRGW
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit

MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <71691570@toto.iv>
X-Mailer: VM 6.43 under 20.4 "Emerald" XEmacs  Lucid
Message-ID: <14692.13805.97208.629346@jodie.lucid>
From: Dvir Oren <dvir@lucidvon.com>
To: rmoya@tsai.es
Subject: Re: firmware problem
Date: Thu,  6 Jul 2000 10:34:29 +0300 (IDT)

Rodrigo Moya writes ("Re: firmware problem"):

> I downgraded to 1.21 and it worked after doing the docpmap /e.

As I said, "docpmpa /e" erased your Bad Block Table.  There really is
no way to restore that.  M-Systems' claim that you shouldn't use that
flash for production use, since it doesn't have that table.  However,
in most chips there are no bad blocks, so erasing the bad block table
has no consequences, and the M-Systems' driver also checks for bad
blocks while it is loaded (it doesn't write it doesn anywhere,
though).

So, be aware.

There is a 'safer' way to do this by first doing 'dformat
/log:<file>', which should save your bad block table, and you could
then restore it.  However that you must do before you destroy the
flash. :)

Anyway, you should try to avoid using 'docpmap /e' as much as possible.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039

--IZZF9RdRGW
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039

--IZZF9RdRGW--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
