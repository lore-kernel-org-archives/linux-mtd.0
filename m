Received: from harrier.viasat.com ([12.198.241.131]
	helo=VGAEXCH02.hq.corp.viasat.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EzzZV-0007Gf-5K
	for linux-mtd@lists.infradead.org; Fri, 20 Jan 2006 11:57:11 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Jan 2006 12:01:04 -0500
Message-ID: <A8E6CBCE61F8D5478F6349C914A015BB015C3A18@COURIER.vmd.viasat.com>
From: "Agarwal, Anil" <Anil.Agarwal@viasat.com>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2 write behavior
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using jffs2 on an embedded powerpc system with 64KB-sector NOR
flash.
=20
If I write a single file, 128 bytes at a time, using write(), then
the time taken by each sequential write operation is generally as
follows -
=20
0. t 30 ms
1. t 50 ms
2. t 68 ms
3. t 86 ms
4. t 105 ms
5. t 123 ms
6. t 142 ms
7. t 159 ms
8. t 177 ms
9. t 195 ms
10. t 213 ms
11. t 231 ms
12. t 248 ms
13. t 267 ms
14. t 285 ms
15. t 302 ms
16. t 321 ms
17. t 349 ms
18. t 358 ms
19. t 374 ms
20. t 393 ms
21. t 410 ms
22. t 428 ms
23. t 446 ms
24. t 464 ms
25. t 481 ms
26. t 503 ms
27. t 577 ms
28. t 534 ms
29. t 552 ms
30. t 570 ms
31. t 588 ms

32. t 32 ms
33. t 50 ms
34. t 68 ms
35. t 87 ms
36. t 104 ms
37. t 123 ms
38. t 141 ms
39. t 159 ms
40. t 177 ms
41. t 195 ms
42. t 213 ms
43. t 231 ms
...
=20
It almost appears that jffs2 writes 128 bytes to flash the first time,
256 bytes the second time,=20
and so on until it reaches 4096 bytes (the Linux page size?).
The flash write time for 128 bytes is ~20 ms, based on the chip spec.
=20
If the above observation is true, then it would imply that
jffs2 wrote more than 64 KBytes to flash for 4 KBytes of real file data.
=20
Of course, one can use buffered writes (fwrite) to improve this,
but the above behavior seems suspicious.
Is it a consequence of writing out page buffers from the start of the
page buffer
in jffs2_write_commit()?
=20
Can someone please clarify if this is well-known/expected or
if there is something wrong with our jffs2 configuration?=20
=20
Thanks,
Anil Agarwal
=20
