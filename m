Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bNfS-0008A5-00
	for mtd-list@infradead.org; Fri, 09 Mar 2001 14:14:54 +0000
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14bNfQ-00089y-00
	for mtd@infradead.org; Fri, 09 Mar 2001 14:14:53 +0000
Message-ID: <003801c0a8a7$b7a320e0$0d3318b5@jolt>
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>,
	<mtd@infradead.org>
References: <EADB10BAC266A14A85ECBF8686A73E310A910E@kolkrabbi.flaga.is>
Subject: Re: Abstractation
Date: Fri, 9 Mar 2001 15:46:23 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

> I need to add a cfi_cmdset_0003 to support a Intel chip that we have in
> our boards.

I posted a hack for this some days ago. Just set P_ID to 1 (instead of 3)
right after it was filled and everythings works fine with the cmdset_0001
module.

Hope that helps,
    Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
