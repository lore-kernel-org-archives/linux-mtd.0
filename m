Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qYDw-0001ow-00
	for mtd-list@infradead.org; Fri, 20 Apr 2001 11:33:12 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qYDv-0001op-00
	for mtd@infradead.org; Fri, 20 Apr 2001 11:33:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E14qQUf-000802-00@infradead.org> 
References: <E14qQUf-000802-00@infradead.org> 
To: ds@schleef.org
Cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/drivers/mtd/chips sharp.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Apr 2001 11:32:51 +0100
Message-ID: <24868.987762771@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ds@infradead.org said:
> Modified Files:
> 	sharp.c
> Log Message: Updates from my local development tree
> Compilation fixes


-	mtd_register_map_driver(&sharp_driver);
+
+	inter_module_register(im_name, THIS_MODULE, &sharp_probe);
+
+	return 0;

Actually I think I prefer your original way of doing it. Let's hide the 
implementation details from the map and chip drivers. Do you have the 
rest of the associated code?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
